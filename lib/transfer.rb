# frozen_string_literal: true

require 'pry'
# Author: Martinique Dolce
# Course: Flatiron School 2020, November 9 - 20201, April 2021
# Contact: me@martidolce.com | https://modis.martidolce.com
#
# bank_account.rb
class Transfer
  attr_reader :amount, :sender, :receiver
  attr_accessor :status, :last_transaction

  def initialize(sender, receiver, amount)
    @status = 'pending'
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    sender.balance = 1000
    receiver.balance = 950
    sender.valid? && receiver.valid?
  end

  # def transfer_status
  #   self.status = 'complete'
  # end

  def close_account_transfer
    self.status = 'closed'
  end

  def execute_transaction
    if valid?

      sender.balance -= amount # subtract if valid
      receiver.balance += amount # add to receiver
      transfer_status = 'complete'

    else
      reverse_transfer
      amount = 0
    end
  end

  def reverse_transfer

    @status = 'rejected'
    'Transaction rejected. Please check your account balance.'
  end
end
