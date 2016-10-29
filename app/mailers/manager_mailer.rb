class ManagerMailer < ApplicationMailer
	def email(manager)
		@manager = manager
		mail(to: manager.email, from: "bot@example.com", subject: 'Daily Overtime Request Email')	
	end
end
