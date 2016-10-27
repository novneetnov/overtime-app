require 'rails_helper'

describe 'Homepage' do
	it 'allows the Admin to Approve Posts from the Homepage' do
		admin = FactoryGirl.create(:admin_user)
		post = FactoryGirl.create(:post_with_user)
		login_as(admin, scope: :user)

		visit root_path
		click_link "Approve"

		expect(current_path).to eq post_path(post)
		expect(post.reload.status).to eq("approved")
	end
end
