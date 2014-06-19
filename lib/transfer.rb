class Transfer
  attr_accessor :transferer, :transferee, :transfer_amount

  def initialize(transferer, transferee, transfer_amount)
    @transferer = transferer
    @transferee = transferee
    @transfer_amount = transfer_amount
  end

  def both_valid?
    transferer.valid? && transferee.valid?
  end

  def execute_transaction
    if both_valid?
      transferer.transfer_money(transfer_amount)
      transferee.accept_transfer(transfer_amount)
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if both_valid?
      transferee.transfer_amount(transfer_amount)
      transferer.accept_transfer(transfer_amount)
    else
      reject_transfer
    end
  end

  def reject_transfer
    if !transferer.valid?
      "Transaction rejected. Please check your account balance."
    end
  end
end