class GroupPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def create?
    user.leader?
  end

  def new?
    create?
  end

  def update?
    user.leader?
  end

  def edit?
    update?
  end

  def destroy?
    user.leader?
  end

  Scope = Class.new(ApplicationPolicy::Scope)
end
