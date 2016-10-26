require 'rails_helper'

describe AuditLog do
	let!(:audit_log) { FactoryGirl.create(:audit_log) }
	let(:admin) { FactoryGirl.create(:admin_user) }
	before :each do
		login_as(admin, scope: :user)
	end

	describe "#index: " do
		it 'has an index action that can be reached' do
			visit audit_logs_path
			expect(page.status_code).to eq 200
		end

		it 'renders audit log content' do
			visit audit_logs_path
			expect(page).to have_content(audit_log.user.full_name) 
		end

		it 'cannot be accessed by non-admin user' do
			logout(:user)
			user = audit_log.user
			login_as(user, scope: :user)
			
			visit audit_logs_path
			expect(current_path).to eq root_path
		end
	end
end
