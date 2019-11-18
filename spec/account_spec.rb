require 'account'

describe Account do
subject(:account) { described_class.new}
 
  describe "#deposit" do
    it "increases total balance by 1000 when user deposits 1000" do
      account.deposit(1000)
      expect(account.total_balance).to eq 1000
    end
  end

  describe "#withdraw" do
    it "decreases balance by 500 when user withdraws 500" do
      account.deposit(1000)
      account.withdraw(500)
      expect(account.total_balance).to eq 500
    end
    it "returns an error if there are insufficient funds to withdraw" do
      account.deposit(500)
      expect{ account.withdraw(600) }.to raise_error "Insufficient funds"
    end
  end

  describe "#record_transaction" do
    it "pushes a new hash into the transactions array, containing details of the current debit withdrawal" do
      account.deposit(1000)
      expect(account.transactions.count).to eq 1 
    end  
    it "pushes a new hash into the transactions array, containing details of the current credit deposit" do
      account.deposit(1000)
      account.withdraw(50)
      expect(account.transactions.count).to eq 2 
    end
    it "resets credit total to 0" do
      account.deposit(800)
      expect(account.credit).to eq 0
    end
    it "resets debit total to 0" do
      account.deposit(800)
      expect(account.debit).to eq 0
    end
  end

  describe "#set_date" do
    it "sets date to 10-01-2012 when user deposits 1000" do
      account.credit = 1000
      account.set_date
      expect(account.date).to eq ("10-01-2012")
    end 
    it "sets date to 13-01-2012 when user deposits 2000" do
      account.credit = 2000
      account.set_date
      expect(account.date).to eq ("13-01-2012")
    end 
    it "sets date to 14-01-2012 when user withdraws 500" do
      account.debit = 500
      account.set_date
      expect(account.date).to eq ("14-01-2012")
    end 
  end
end





