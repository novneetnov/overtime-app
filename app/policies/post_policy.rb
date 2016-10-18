class PostPolicy < ApplicationPolicy
	def update?
		return true if admin? 
		return true if post_creator? and not post_approved?
	end

	private

	def admin?
		admin_types.include?(user.type)
	end

	def post_approved?
		record.approved?
	end

	def post_creator?
		record.user_id == user.id
	end

end
