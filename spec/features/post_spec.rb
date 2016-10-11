require 'rails_helper'

describe 'Post' do
	before do
		@user = FactoryGirl.create(:user)
		login_as(@user, :scope => :user)
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
			post1 = FactoryGirl.build_stubbed(:post, user_id: @user.id)
			post2 = FactoryGirl.build_stubbed(:second_post, user_id: @user.id)
			visit posts_path
			expect(page).to have_content(/Rationale|Content/)
		end
	end

	describe 'Creation' do
		before do
			visit new_post_path
		end
		it 'has a new form that can be reached' do
			expect(page.status_code).to eq(200)
		end

		it 'can be created from new form page' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "Some Rationale"
			click_on 'Save'
			expect(page).to have_content("Some Rationale")
		end

		it 'will have a user associated with it' do
			fill_in 'post[date]', with: Date.today
			fill_in 'post[rationale]', with: "User Association"
			click_on 'Save'
			expect(@user.posts.last.rationale).to eq("User Association")
		end
	end

	#describe 'edit' do
		#it 'can be reached by clicking edit on index page' do
			#post = FactoryGirl.create(:post, user_id: @user.id)
			#visit post_path

			#click_on "Edit"
			#expect(page.status_code).to eq(200)
		#end
	#end

end
