class Post < ActiveRecord::Base
	enum status: { submitted: 0, approved: 1, rejected: 2 }
	belongs_to :user
	validates_presence_of :date, :rationale, :daily_hours
	validates :daily_hours, numericality: { greater_than: 0.0 }

	scope :posts_by, ->(user) { where(user_id: user.id) }

	after_save :update_status_of_audit_log

	private
	def update_status_of_audit_log
		audit_log = AuditLog.where(user_id: self.user.id, start_date: (self.date - 7.days..self.date)).last
		if audit_log
			audit_log.confirmed! if self.submitted? or self.approved?
			if self.rejected?
				audit_log.pending!
				audit_log.update!(end_date: nil)
			end
		end
	end
end
