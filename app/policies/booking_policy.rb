class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # handles booking index view after booking is made
    end
  end

  def show?
    # not used
  end

  def create?
    true
  end

  def destroy?
    record.user == user
  end
end
