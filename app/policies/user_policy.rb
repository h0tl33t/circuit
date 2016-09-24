class UserPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    true
  end

  def edit?
    user == record
  end

  def update?
    user == record
  end

  def destroy?
    false
  end
end
