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

  def new?
    # not needed since in ApplicationPolicy
  end

  def create?
    true
  end

  def edit?
     # not needed, defer to delete booking
  end

  def update?
     # not needed, defer to delete booking
  end

  def destroy?
    record.user == user
  end
end
