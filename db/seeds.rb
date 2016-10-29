Post.delete_all
User.delete_all

#Post.skip_callback(:save, :after, :update_audit_log)

@user = User.create(
	email: "user@example.com", 
	password: "password", 
	password_confirmation: "password", 
	first_name: "Jon", 
	last_name: "Snow",
	phone: "1234567890"
)

puts "1 User created"

@admin = AdminUser.create(
	email: "admin@example.com", 
	password: "password", 
	password_confirmation: "password", 
	first_name: "Jon", 
	last_name: "Snow",
	phone: "1234567890" 
)

puts "1 Admin User Created"

4.times do |n|
	AuditLog.create!(
		user_id: @user.id,
		status: 0, 
		start_date: (Date.today - (7*n+6).days)
	) 
end

puts "4 AuditLogs created."

3.times do |n|
	Post.create!(
		date: Date.today - (7*n+7).days, 
		#rationale: "#{post} rationale content", 
		rationale: "Ipsum praesentium adipisci dolore tenetur sint alias maiores molestiae sequi nam? Sint nemo architecto cumque reprehenderit natus. Esse nobis quidem vero dignissimos delectus. Earum ab error fugit esse id eum!",
		user_id: @user.id, 
		overtime_request: 2.5
	)
end

puts "3 Posts created"


