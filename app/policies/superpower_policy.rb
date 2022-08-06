class SuperpowerPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end

  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user == record.user
    # user == record.user || user.admin this can be used once admin is declareds
  end

  def destroy?
    user == record.user
  end
end
