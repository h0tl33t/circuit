class UserPolicy < ApplicationPolicy
  def initialize(*args)
    super

    raise Pundit::NotAuthorizedError if user.inactive?
  end

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
