require 'rails_helper'

RSpec.describe Post, type: :model do
	describe "creation" do
		before do
			@post = FactoryGirl.create(:post_with_user)
		end
		it 'can be created' do
			expect(@post).to be_valid
		end

		it 'cannot be created without a date and rationale' do
			@post.date = nil
			@post.rationale = nil
			expect(@post).to_not be_valid
		end
		it 'has an overtime request greater than 0.0' do
			@post.update(overtime_request: 0.0)
			expect(@post).to_not be_valid
		end
	end
end
