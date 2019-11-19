require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new}
  let(:account) { double(:account) }

  describe "#record_transaction" do
    it "pushes a new hash into the transactions array when a user makes a deposit" do
      transaction.record_transaction(1000)
      expect(transaction.transactions.count).to eq 1 
    end  
    it "pushes a new hash into the transactions array, containing details of the current debit withdrawal" do
      test_output = {credit: 1000, debit: 0, balance: 1000, date: Time.now.strftime("%d/%m/%Y") }
      transaction.credit = 1000
      transaction.record_transaction(1000)
      expect(transaction.transactions[0]).to eq(test_output)
    end
  end
end