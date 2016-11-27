Post.delete_all
AuditLog.delete_all
User.delete_all

#Post.skip_callback(:save, :after, :update_audit_log)

@employee1 = Employee.create!(
	email: "novneet@iith.ac.in", 
	password: "password", 
	password_confirmation: "password", 
	first_name: "Jon", 
	last_name: "Snow",
	phone: "7894418310",
	ssn: 1234,
	company: "ABC"
)
@employee2 = Employee.create!(
	email: "employee@example.com", 
	password: "password", 
	password_confirmation: "password", 
	first_name: "Jon", 
	last_name: "Snow",
	phone: "9876543210",
	ssn: 1234,
	company: "ABC"
)
puts "2 User created"

@admin1 = AdminUser.create!(
	email: "novneet346iith@gmail.com", 
	password: "password", 
	password_confirmation: "password", 
	first_name: "Jon", 
	last_name: "Snow",
	phone: "9438405083",
	ssn: 1234,
	company: "ABC"
)
@admin2 = AdminUser.create!(
	email: "admin@example.com", 
	password: "password", 
	password_confirmation: "password", 
	first_name: "Jon", 
	last_name: "Snow",
	phone: "1234567890",
	ssn: 1234,
	company: "ABC"
)

puts "2 Admin User Created"

4.times do |n|
	AuditLog.create!(
		user_id: @employee1.id,
		status: 0, 
		start_date: (Date.today - (7*n+6).days)
	) 
end
4.times do |n|
	AuditLog.create!(
		user_id: @employee2.id,
		status: 0, 
		start_date: (Date.today - (7*n+6).days)
	) 
end
puts "4 AuditLogs of each employee created."

3.times do |n|
	Post.create!(
		date: Date.today - (7*n+7).days, 
		#work_performed: "#{post} rationale content", 
		work_performed: "Ipsum praesentium adipisci dolore tenetur sint alias maiores molestiae sequi nam? Sint nemo architecto cumque reprehenderit natus. Esse nobis quidem vero dignissimos delectus. Earum ab error fugit esse id eum!",
		user_id: @employee1.id, 
		daily_hours: 2.5
	)
end
3.times do |n|
	Post.create!(
		date: Date.today - (7*n+7).days, 
		#work_performed: "#{post} rationale content", 
		work_performed: "Ipsum praesentium adipisci dolore tenetur sint alias maiores molestiae sequi nam? Sint nemo architecto cumque reprehenderit natus. Esse nobis quidem vero dignissimos delectus. Earum ab error fugit esse id eum!",
		user_id: @employee2.id, 
		daily_hours: 2.5
	)
end

puts "3 Posts of each employee created"


