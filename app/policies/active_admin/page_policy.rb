module ActiveAdmin
  class PagePolicy < ApplicationPolicy
    def show?
      true
    end

    Scope = Class.new(ApplicationPolicy::Scope)
  end
end
