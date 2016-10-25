require 'rails_helper'

RSpec.describe AuditLog, type: :model do
	let(:audit_log) { FactoryGirl.create(:audit_log) }

	describe 'creation' do
		it 'can be properly created' do
			expect(audit_log).to be_valid
		end
	end


	it { should belong_to(:user) }

	it { should validate_presence_of :status }

	it { should validate_presence_of :start_date }

	it "should have a start date equal to 6 days prior" do
		new_audit_log = FactoryGirl.create(:audit_log_without_status_and_start_date)
		expect(new_audit_log.start_date).to eq(Date.today - 6)
	end

end

