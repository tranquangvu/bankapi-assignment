# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :customer, :record

  def initialize(customer, record)
    @customer = customer
    @record = record
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
    def initialize(customer, scope)
      @customer = customer
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :customer, :scope
  end
end
