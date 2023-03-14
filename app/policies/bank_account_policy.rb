class BankAccountPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def show?
    record.customer_id == customer.id
  end
end
