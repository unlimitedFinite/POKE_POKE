class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show?
    # not used
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    record.user == user
  end
end
