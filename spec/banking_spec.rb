describe "BANKING" do 

  let(:avi) { BankAccount.new("Avi") }
  let(:amanda) { BankAccount.new("Amanda") }
  let(:transfer) { Transfer.new(amanda, avi, 50) }
  let(:bad_transfer) { Transfer.new(amanda, avi, 4000) }

  describe BankAccount do
    it "can initialize a Bank Account" do
      expect(avi).to be_a(BankAccount)
    end

    it "initializes with a name" do
      expect(avi.name).to eq("Avi")
    end

    it "always initializes with balance of 1000" do
      expect(avi.balance).to eq(1000)
    end

    it "always initializes with a status of 'open'" do
      expect(avi.status).to eq("open")
    end

    it "can't change its name" do 
      expect { avi.name = "Bob" }.to raise_error
    end

    it "can deposit money into its account" do 
      expect(avi.balance).to eq(1000)
      avi.deposit(1000)
      expect(avi.balance).to eq(2000)
    end

    it "can display its balance" do 
      expect(avi.display_balance).to eq("Your Balance is $#{avi.balance}.")
    end

    it "is valid with an open status and a balance greater than 0" do 
      expect(amanda.valid?).to eq(true)
    end

    it "can close its account" do 
      avi.close_account
      expect(avi.status).to eq("closed")
    end
  end

  describe Transfer do 
    it "can initialize a Transfer" do
      expect(transfer).to be_a(Transfer)
    end

    it "initializes with a sender" do 
      expect(transfer.sender).to eq(amanda)
    end

    it "initializes with a receiver" do 
      expect(transfer.receiver).to eq(avi)
    end

    it "always initializes with a status of 'pending'" do
      expect(transfer.status).to eq("pending")
    end

    it "initializes with a transfer amount" do 
      expect(transfer.transfer_amount).to eq(50)
    end

    it "can check that both accounts are valid" do
      expect(avi.valid?).to eq (true)
      expect(amanda.valid?).to eq(true) 
      expect(transfer.both_valid?).to eq(true)
    end

  end

  describe "Making transfers between two accounts" do

    it "can execute a successful transaction between two accounts" do 
      transfer.execute_transaction
      expect(amanda.balance).to eq(950)
      expect(avi.balance).to eq(1050)
      expect(transfer.status).to eq("complete")
    end

    it "each transfer can only happen once" do 
      transfer.execute_transaction
      expect(amanda.balance).to eq(950)
      expect(avi.balance).to eq(1050)
      expect(transfer.status).to eq("complete")
      transfer.execute_transaction
      expect(amanda.balance).to eq(950)
      expect(avi.balance).to eq(1050)
    end

    it "can reject a transfer if the sender doesn't have a valid account" do
      expect(bad_transfer.execute_transaction).to eq("Transaction rejected. Please check your account balance.")
      expect(bad_transfer.status).to eq("rejected")
    end

    it "can reverse a transfer between two accounts" do
      transfer.execute_transaction
      expect(amanda.balance).to eq(950)
      expect(avi.balance).to eq(1050)
      transfer.reverse_transfer
      expect(avi.balance).to eq(1000)
      expect(amanda.balance).to eq(1000)
      expect(transfer.status).to eq("reversed")
    end

    it "it can only reverse executed transfers" do
      transfer.reverse_transfer
      expect(amanda.balance).to eq(1000)
      expect(avi.balance).to eq(1000)
    end

  end
end