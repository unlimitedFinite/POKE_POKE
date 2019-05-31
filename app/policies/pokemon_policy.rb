class PokemonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not("user_id = :user or is_active = :is_active or latitude is null or longitude is null", user: user, is_active: false)
    end
  end

  def show?
    true
  end

  def inventory?
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

  def deactivate?
    record.user == user
  end

  def reactivate?
    record.user == user
  end
end
