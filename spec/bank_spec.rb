require 'bank'

describe Account do
subject(:account) { described_class.new}
 
  describe "#deposit" do
    it "increses total balance by 1000 when user deposits 1000" do
      account.deposit(1000)
      expect(account.balance).to eq (1000)
    end
  end

  describe "#withdraw" do
    it "decreases balance by 500 when user withdraws 500" do
      account.deposit(1000)
      account.withdraw(500)
      expect(account.balance).to eq (500)
    end
    it "returns an error if there are insufficient funds" do
      account.deposit(500)
      expect{ account.withdraw(600) }.to raise_error "Insufficient funds"
    end
  end
end





