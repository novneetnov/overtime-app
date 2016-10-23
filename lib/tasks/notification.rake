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

end
