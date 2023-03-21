class EventPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    true
  end

  def new?
    record.user_id == user
  end

  def edit?
    record.user_id == user
  end

  def update?
    record.user_id == user
  end

  def destroy?
    record.user_id == user
  end
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end
end
