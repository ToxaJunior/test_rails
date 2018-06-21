class PermissionPolicy < ApplicationPolicy
  def new?
    user.admin?
  end

  def create?
    user.admin?
  end
end