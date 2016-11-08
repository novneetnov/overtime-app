require 'rails_helper'

RSpec.describe User, type: :model do
	
	before do
		@user = FactoryGirl.create(:user)
	end

	describe "creation" do 
		it "can be created" do
			expect(@user).to be_valid
		end
	end

	describe "validation" do
		it "cannot be created without firstname" do
			@user.first_name = nil
			expect(@user).to_not be_valid
		end

		it "cannot be created without lastname" do
			@user.last_name = nil
			expect(@user).to_not be_valid
		end

		it 'cannot be created without a phone number' do
			@user.phone = nil
			expect(@user).to_not be_valid
		end

		it 'requires the phone attr to only contain integers' do
			@user.phone = "mygreatstr"
			expect(@user).to_not be_valid
		end

		it 'requires the phone attr to only have 10 chars' do
			@user.phone = "12345678901"	
			expect(@user).to_not be_valid
		end
	end

	describe "custom name methods" do
		it 'has a full_name method that combines first and last name' do
			expect(@user.full_name).to eq("SNOW, JON")
		end
	end

	describe "relationship between Admins and Employees" do
		it 'allows for the admins to be associated with multiple employees' do
			employee_1 = @user
			employee_2 = FactoryGirl.create(:second_user)
			admin = FactoryGirl.create(:admin_user)

			Hand.create!(user_id: admin.id, hand_id: employee_1.id)
			Hand.create!(user_id: admin.id, hand_id: employee_2.id)

			expect(admin.hands.count).to eq 2
		end
	end

end
