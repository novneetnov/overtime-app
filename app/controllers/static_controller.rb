class StaticController < ApplicationController
	def homepage
		if admin_types.include? current_user.type
			@pending_approvals = Post.includes(:user).submitted
			@recent_audit_items = AuditLog.includes(:user).last(10)
		else
			 #DSB
		end
	end
end
