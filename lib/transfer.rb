class Transfer
  attr_accessor :sender, :receiver, :transfer_amount

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @transfer_amount = transfer_amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && sender.balance > transfer_amount
      sender.transfer_money(transfer_amount)
      receiver.accept_transfer(transfer_amount)
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if both_valid? && receiver.balance > transfer_amount
      receiver.transfer_money(transfer_amount)
      sender.accept_transfer(transfer_amount)
    else
      reject_transfer
    end
  end

  def reject_transfer
    "Transaction rejected. Please check your account balance."
  end
end