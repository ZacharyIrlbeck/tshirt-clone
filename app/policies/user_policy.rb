class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.admin
  end

  def show?
    true
  end

  def destroy?
    user.admin
  end
end
