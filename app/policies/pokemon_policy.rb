class PokemonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # if user.is_owner?
      #   score.where(user: current_user)
      # else
      #   scope.where()

      # end
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
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
