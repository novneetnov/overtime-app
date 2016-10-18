require 'rails_helper'

describe 'navigate' do
	
	let!(:user) { FactoryGirl.create(:user) }
	let!(:post) { FactoryGirl.create(:post, user_id: user.id) }
	let(:second_post) { FactoryGirl.create(:second_post, user_id: user.id) }
	let(:post_with_another_user) { FactoryGirl.create(:post_with_user) }
	let(:second_user) { FactoryGirl.create(:second_user) }

	before do
		login_as(user, :scope => :user)
	end

	describe 'index' do
		before do
			visit posts_path
		end
		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it 'has a title of Posts' do
			expect(page).to have_content(/Posts/)
		end

		it 'has a list of Posts' do
			visit posts_path
			expect(page).to have_content(/Rationale|Content/)
		end

		it 'has a scope that Users can see only their own posts' do
			visit posts_path
		 	expect(page).to_not have_content(post_with_another_user.rationale)
		end
	end

	describe 'new' do
		it 'has a link to create post from navbar' do
			visit root_path
			within "ul.nav" do
				click_link("Add New Entry")
			end
			expect(current_path).to eq new_post_path
		end
	end

	describe 'creation' do
		before do
			visit new_post_path
		end
		it 'has a new form that can be reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "Some Rationale"
			click_on 'Create'
			expect(page).to have_content("Some Rationale")
		end

		it 'will have a user associated with it' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "User Association"
			click_on 'Create'
			expect(user.posts.last.rationale).to eq("User Association")
		end
	end

	describe 'Post' do

		it 'can be edited' do
			visit edit_post_path(post)
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "Edited Rationale"
			click_on 'Update'
			expect(page).to have_content("Edited Rationale")
		end

		it 'cannot be edited by a non authorized user' do
			logout :user
			login_as(second_user, scope: :user)	
			
			visit edit_post_path(post)
			expect(current_path).to eq root_path
		end
	end

	describe Post do
		it 'can be deleted' do
			visit posts_path
			within "#post_#{post.id}" do
				click_link("Delete")
			end
			expect(current_path).to eq posts_path
			expect(page).to_not have_content(post.rationale)
		end
	end

end
