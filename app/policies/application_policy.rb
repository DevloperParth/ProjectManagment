# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record, :job_detail, :employer, :employee

  def initialize(user, record, :job_detail, employee, employee)
    @user = user
    @record = record
    @job_detail = job_detail
    @employee = employee
    @employer = employer
  end

  def index?
    false
  end

  def show?
    false
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
