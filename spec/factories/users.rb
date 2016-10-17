FactoryGirl.define do

	#sequence :email do |n|
		#"test#{n}@example.com"
	#end
	
	factory :user do
		first_name "Jon"
		last_name "Snow"
		#email { generate :email }
		email "user1@test.com"
		password "password"
		password_confirmation "password"
	end

	factory :admin_user, class: "AdminUser" do
		first_name "Admin"
		last_name "User"
		email "admin@test.com"
		password "password"
		password_confirmation "password"
	end

	factory :second_user, class: "User" do
		first_name "Second"
		last_name "User"
		email "user2@test.com"
		password "password"
		password_confirmation "password"
	end

end
