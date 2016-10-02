class UserPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    true
  end

  def edit?
    user.leader? || user == record
  end

  def update?
    user.leader? || user == record
  end

  def destroy?
    false
  end
end
