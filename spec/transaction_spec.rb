require 'transaction'

describe Transaction do
  subject(:transaction) { described_class.new}
  let(:account) { double(:account) }

  describe "#record_transaction" do
    it "pushes a new hash into the transactions array when a user makes a deposit" do
      transaction.record_transaction(1000)
      expect(transaction.transactions.count).to eq 1 
    end  
  end

  describe "#print_statement" do
  header = "date || credit || debit || balance"
    it "displays the header of the statement" do
      expect{ transaction.header }.to output(header).to_stdout
    end
  end
end