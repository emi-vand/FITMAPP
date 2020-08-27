class RestaurantBookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
    # user.owner
  end

  def update?
    true
    # record.user == user
  end

  def destroy?
    true
    # record.user == user
  end
end
