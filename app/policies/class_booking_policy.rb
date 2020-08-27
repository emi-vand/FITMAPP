class ClassBookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
    # record.restaurant.user == user
  end

  def update?
    true
    # record.restaurant.user == user
  end

  def destroy?
    true
    # record.restaurant.user == user
  end
end
