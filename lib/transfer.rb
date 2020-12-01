# frozen_string_literal: true

require 'pry'
# Author: Martinique Dolce
# Course: Flatiron School 2020, November 9 - 20201, April 2021
# Contact: me@martidolce.com | https://modis.martidolce.com
#
# bank_account.rb
class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @status = 'pending'
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  # valid?
  # can check that both accounts are valid
  # @return [TrueClass, FalseClass]
  def valid?
    sender.valid? && receiver.valid?
  end

  # execute_transaction - can execute a successful transaction between two accounts
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
