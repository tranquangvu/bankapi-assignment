class TransferPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end
end
