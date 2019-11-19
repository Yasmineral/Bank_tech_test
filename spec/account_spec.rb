require 'account'

describe Account do
subject(:account) { described_class.new}
let(:transaction) { double(:transaction) }
 
  describe "#deposit" do
    it "increases total balance by 1000 when user deposits 1000" do
      expect { account.deposit(1000) }.to change { account.total_balance }.by(1000) 
    end
  end

  describe "#withdraw" do
    it "decreases balance by 500 when user withdraws 500" do
      account.deposit(1000)
      expect { account.withdraw(500) }.to change { account.total_balance }.by(-500)
    end
    it "returns an error if there are insufficient funds to withdraw" do
      account.deposit(500)
      expect{ account.withdraw(600) }.to raise_error "Insufficient funds"
    end
  end
end





