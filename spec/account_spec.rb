require 'account'

describe Account do
  let(:statement) { double(:statement) }
  subject(:account) { described_class.new(statement) }

  describe '#deposit' do
    it 'increases total balance by 10 when user deposits 10' do
      expect { account.deposit(10) }.to change { account.total_balance }.by(10)
    end
    it 'the deposit transaction is recorded in the transactions array' do
      account.deposit(100)
      expect(account.transactions.length).to eq 1
    end
  end

  describe '#withdraw' do
    it 'decreases balance by 5 when user withdraws 500' do
      account.deposit(1000)
      expect { account.withdraw(50) }.to change { account.total_balance }.by(-50)
    end
    it 'returns an error if there are insufficient funds to withdraw' do
      account.deposit(500)
      expect { account.withdraw(600) }.to raise_error 'Insufficient funds'
    end
    it 'the withdrawal transaction is recorded in the transactions array' do
      account.total_balance = 200
      account.withdraw(100)
      expect(account.transactions.length).to eq 1
    end
  end

  describe '#add_transaction' do
    it 'records transaction details and pushes new hash into the transactions array' do
      account.deposit(100)
      expect(account.transactions).to include(credit: 100, debit: 0, balance: 100, date: Time.now.strftime('%d/%m/%Y'))
    end
    it 'resets credit total to 0 after a transaction has been recoreded' do
      account.deposit(100)
      expect(account.credit).to eq 0
    end
    it 'resets debit total to 0 after a transaction has been recoreded' do
      account.total_balance = 500
      account.withdraw(100)
      expect(account.debit).to eq 0
    end
  end

  describe '#print_statement' do
    it 'calls upon the statement class to print all recorded transactions' do
      allow(statement).to receive(:generate_statement)
      expect(statement).to respond_to(:generate_statement)
      account.print_statement
    end
  end
end
