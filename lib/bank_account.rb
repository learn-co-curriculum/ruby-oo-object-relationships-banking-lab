# frozen_string_literal: true

require 'pry'
# Author: Martinique Dolce
# Course: Flatiron School 2020, November 9 - 20201, April 2021
# Contact: me@martidolce.com | https://modis.martidolce.com
#
# bank_account.rb

class BankAccount
  attr_accessor :initialize, :balance, :status
  attr_reader :name

  def initialize(_initialize)
    @initialize = BankAccount
    @name = 'Avi'
    @balance = 1000
    @status = 'open'
  end

  def deposit(account)
    @balance += account
  end

  def display_balance
    "Your balance is $#{balance}."
  end

  def close_account
    self.status = 'closed'
  end

  def valid?
    balance.positive? && status == 'open'
  end
end
