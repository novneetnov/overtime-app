namespace :notification do
  desc "Sends sms notification to employees asking them to log if they had overtime or not"
  task sms: :environment do
		# 1. Schedule heroku to run this task on every Sunday at 5pm.
		# 2. Iterate over all employees
		# 3. Skip admin Users
		# 4. Send a message that has instructions and a link to log time.

		#User.all.each do |user|
			#SmsTool.send_sms()
		#end
	end

	desc "Sends mail notification to managers(Admin Users) each day to inform of pending overtime requests"
	task manager_email: :environment do
		submitted_post = Post.submitted
		admin_users = AdminUser.all
		if submitted_post.count > 0
			admin_users.each do |admin|
				ManagerMailer.email(admin).deliver_now
			end
		end
	end
end
