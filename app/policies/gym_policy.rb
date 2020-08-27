class GymPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.owner
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def favorite?
    true
  end
end
