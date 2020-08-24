class GymClassPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.gym.user == user
  end

  def update?
    record.gym.user == user
  end

  def destroy?
    record.gym.user == user
  end
end
