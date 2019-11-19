require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:transaction) { double(:transaction) }

  describe '#deposit' do
    it 'increases total balance by 10 when user deposits 1000' do
      expect { account.deposit(10) }.to change { account.total_balance }.by(10)
    end
  end

  describe '#withdraw' do
    it 'decreases balance by 5 when user withdraws 500' do
      account.deposit(1000)
      expect { account.withdraw(5) }.to change { account.total_balance }.by(-5)
    end
    it 'returns an error if there are insufficient funds to withdraw' do
      account.deposit(500)
      expect { account.withdraw(600) }.to raise_error 'Insufficient funds'
    end
  end
end
