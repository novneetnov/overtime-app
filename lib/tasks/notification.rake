namespace :notification do
	desc "Sends sms notification to employees asking them to log if they had overtime or not"
	task sms: :environment do
		if Time.now.sunday?
			employees = Employee.all
			notification_message = "Please Log in to the Overtime management dashboard to request overtime or confirm your hours last week: https://overtime-approval-system.herokuapp.com/"
			employees.all.each do |employee|
				SmsTool.send_sms(number: employee.phone, message: notification_message, country_code: "91")
			end
		end
	end

	desc "Sends mail notification to managers(Admin Users) each day to inform of pending overtime requests"
	task manager_email: :environment do
		submitted_posts = Post.submitted
		admin_users = AdminUser.all
		if submitted_posts.count > 0
			admin_users.each do |admin|
				ManagerMailer.email(admin).deliver_now
			end
		end
	end
end
