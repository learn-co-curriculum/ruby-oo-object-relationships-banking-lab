require 'spec_helper'

describe BankAccount do 
  let(:avi) { BankAccount.new("Avi") }
  let(:amanda) { BankAccount.new("Amanda") }
  let(:transfer) { Transfer.new(amanda, avi, 50) }

  describe "Basic BankAccount functionality" do
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

  describe "Basic Transfer functionality" do 
    it "can initialize a Transfer" do
      expect(transfer).to be_a(Transfer)
    end

    it "initializes with a transferer" do 
      expect(transfer.transferer).to eq(amanda)
    end

    it "initializes with a transferee" do 
      expect(transfer.transferee).to eq(avi)
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

    xit "an account is able to transfer money" do 
    end

    xit "an account is able to accept a transfer from another account" do 
    end

    describe "Transfer handles a transfer between accounts" do 

      xit "can execute a transaction between two accounts" do 
      end

      xit "can reject a transfer if the transferer doesn't have a valid account" do 
      end

      xit "can reverse a transfer between two accounts" do 
      end

    end

  end
end