FactoryGirl.define do
	factory :audit_log do
		user
		status 0
		start_date (Date.today - 6.days)
		end_date nil
	end

	factory :audit_log_without_status_and_start_date, class: "AuditLog" do
		user
		end_date nil
	end

	factory :audit_log_without_user, class: "AuditLog" do
		status 0
		start_date (Date.today - 6.days)
		end_date nil
	end

end
