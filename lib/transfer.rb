require 'bank_account.rb'
require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(name_1, name_2, amount)
    @sender = name_1
    @receiver = name_2
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == 'pending' && @sender.balance >= @amount && @sender.valid? && @receiver.valid?
      #binding.pry
      @receiver.deposit(@amount)
      @sender.deposit(-@amount)
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete' && @sender.balance >= @amount && @sender.valid? && @receiver.valid?
      #binding.pry
      @receiver.deposit(-@amount)
      @sender.deposit(@amount)
      @status = 'reversed'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end
end
