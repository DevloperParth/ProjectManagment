class JobDetailPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def created_by_employer?
    user.employer? && record.employer_id == user.id 
  end

  def create?
    user.admin? || user.employer?
  end

  # Only admin users or companies that created current job can update it
  def update?
    user.admin? || created_by_employer? 
  end

  # Only admin users or companies that created current job can delete it
  def destroy?
    user.admin? || created_by_employer? 
  end

end
