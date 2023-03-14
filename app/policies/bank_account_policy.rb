class BankAccountPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    record.customer_id == customer.id
  end
end
