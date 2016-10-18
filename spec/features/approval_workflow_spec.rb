require 'rails_helper'

feature 'navigate' do
	let(:admin) { FactoryGirl.create(:admin_user) }
	before do
		login_as(admin, scope: :user)
	end

	feature 'Post' do
		let(:post) { FactoryGirl.create(:post, user_id: admin.id) }
		let(:user) { FactoryGirl.create(:user) }
		before do
			visit edit_post_path(post)
		end

		scenario 'has a status that can be edited on the edit form by an Admin' do
			choose 'post_status_approved'
			click_on "Update" 
			expect(post.reload.status).to eq "approved"
		end

		scenario 'cannot be edited by a non admin' do
			logout(:admin)
			login_as(user, scope: :user)	
			visit edit_post_path(post)
			expect(page).to_not have_selector("input[type=radio]")
		end

		scenario 'is not editable by Post Creator after status is approved' do
			logout(:user)
			login_as(user, scope: :user)
			approved_post = FactoryGirl.create(:post, user_id: user.id)
			approved_post.update(status: "approved")
			visit edit_post_path(approved_post)
			expect(current_path).to eq root_path
		end
	end
end
