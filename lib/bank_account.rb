class BankAccount
    attr_reader :name
    attr_accessor :balance, :status
    
    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
    end

    def deposit(amount)
        self.balance += amount
    end

    def display_balance
        return "Your balance is $#{@balance}."
    end

    def valid?
        if @status == 'open' && @balance > 0
            true
        else
            false
        end
    end

    def close_account
        self.status= 'closed'
    end
end
