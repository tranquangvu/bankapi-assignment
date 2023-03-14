class BankAccountTransferSerializer < TransferSerializer
  set_type :transfer

  attribute :transfer_type do |object, params|
    params[:target_bank_account].id == object.from_bank_account_id ? 'sent' : 'received'
  end
end
