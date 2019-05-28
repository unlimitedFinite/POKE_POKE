class PokemonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # if user.is_owner?
      #   scope.where(user: current_user)
      # else
        scope.all
    end
  end

  def show?
    true
  end

  def new?
    # not needed
  end

  def create?
    record.user == user
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
