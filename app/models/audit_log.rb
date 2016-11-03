class AuditLog < ActiveRecord::Base
	enum status: { pending: 0, confirmed: 1 }	

	belongs_to :user
	validates :status, :start_date, presence: true

	after_initialize :set_defaults
	before_update :set_end_date, if: :confirmed?

	scope :by_start_date, -> { order("start_date desc") }

	private
	def set_end_date
		self.end_date = Date.today
	end

	# When the Audit Logs are run via rake task on Sundays, the start date gets set to the previous Mondays.
	def set_defaults
		self.start_date ||= (Date.today - 6.days)
	end
end
