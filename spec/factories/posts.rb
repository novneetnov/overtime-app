FactoryGirl.define do
	factory :post do
		date Date.today
		work_performed "Some Rationale"
		daily_hours 3.5
		#user
	end

	factory :second_post, class: "Post" do
		date Date.yesterday
		work_performed "Some more Content"
		daily_hours 0.5
		#user
	end

	factory :post_with_user, class: "Post" do
		date Date.yesterday
		work_performed "I should not be visible"
		daily_hours 2.0
		user { FactoryGirl.create(:second_user) }
	end
end
