class DishPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.restaurant.user == user
  end

  def update?
    record.restaurant.user == user
  end

  def destroy?
    record.restaurant.user == user
  end
end
