class GymClassPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
    # record.gym.user == user
  end

  def update?
    true
    # record.gym.user == user
  end

  def destroy?
    true
    # record.gym.user == user
  end
end
