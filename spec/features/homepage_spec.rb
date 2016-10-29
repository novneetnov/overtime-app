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

	it 'allows the Employee to change Audit Logs status from the Homepage' do
		user = FactoryGirl.create(:user)
		audit_log = FactoryGirl.create(:audit_log_without_user, user_id: user.id)
		login_as(user, scope: :user)

		visit root_path
		click_link "confirm_#{audit_log.id}"

		expect(current_path).to eq root_path(audit_log)
		expect(audit_log.reload.status).to eq("confirmed")
	end
end
