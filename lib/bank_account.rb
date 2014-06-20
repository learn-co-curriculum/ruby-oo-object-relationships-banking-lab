class BankAccount
  attr_reader :name, :transfer_amount
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  def deposit(deposit_amount)
    self.balance += deposit_amount
  end

  def display_balance
    "Your Balance is $#{balance}."
  end

  def close_account
    self.status = "closed"
  end

  def valid?
    balance > 0 && status == "open"
  end

  def transfer_money(transfer_amount)
    if valid?
      self.balance -= transfer_amount
    end
  end

  def accept_transfer(accepted_transfer_amount)
    if valid?
      self.balance += accepted_transfer_amount
    end
  end

end