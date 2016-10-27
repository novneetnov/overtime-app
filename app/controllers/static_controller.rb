class StaticController < ApplicationController
	def homepage
		@pending_approvals = Post.includes(:user).where(status: "submitted")	
	end
end
