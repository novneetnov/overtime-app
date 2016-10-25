class AuditLog < ActiveRecord::Base
	belongs_to :user
	validates :status, :start_date, presence: true

	after_initialize :set_defaults
	
	private
	
	# When the Audit Logs are run via rake task on Sundays, the start date gets set to the previous Mondays.
	def set_defaults
		self.start_date ||= 6.days.ago
	end
end
