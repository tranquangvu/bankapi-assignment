class AuthCustomerSerializer < CustomerSerializer
  set_type :customer

  attribute :auth_token
end
