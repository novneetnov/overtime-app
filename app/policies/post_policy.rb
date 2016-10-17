class PostPolicy < ApplicationPolicy
	def update?
		record.user_id == user.id or admin_types.include?(user.type)
  end
end
