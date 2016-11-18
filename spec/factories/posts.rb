FactoryGirl.define do
	factory :post do
		date Date.today
		rationale "Some Rationale"
		daily_hours 3.5
		#user
	end

	factory :second_post, class: "Post" do
		date Date.yesterday
		rationale "Some more Content"
		daily_hours 0.5
		#user
	end

	factory :post_with_user, class: "Post" do
		date Date.yesterday
		rationale "I should not be visible"
		daily_hours 2.0
		user { FactoryGirl.create(:second_user) }
	end
end
