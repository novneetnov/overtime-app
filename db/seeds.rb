Post.delete_all
User.delete_all

@user = User.create(email: "user@example.com", 
										password: "password", 
										password_confirmation: "password", 
										first_name: "Jon", 
										last_name: "Snow",
										phone: "1234567890"
									 )

puts "1 User created"

@admin = AdminUser.create(email: "admin@example.com", 
													password: "password", 
													password_confirmation: "password", 
													first_name: "Jon", 
													last_name: "Snow",
													phone: "1234567890" 
												 )

puts "1 Admin User Created"

100.times do |post|
	Post.create!(date: Date.today, 
							 rationale: "#{post} rationale content", 
							 user_id: @user.id, 
							 overtime_request: 2.5)
end

100.times do |audit_log|
	AuditLog.create!(user_id: User.last.id, 
									 status: 0, 
									 start_date: (Date.today - 6.days)) 
end

puts "100 AuditLogs have been created."
