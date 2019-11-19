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
  example_transaction = [{credit: 1000, debit: 0, balance: 1000, date: Time.now.strftime("%d/%m/%Y")}]
    it "displays the header of the statement" do
      expect{ transaction.print_header }.to output(header).to_stdout
    end
    it "prints out the entries contained in the transactions array" do
      transaction.transactions = [{credit: 1000, debit: 0, balance: 1000, date: Time.now.strftime("%d/%m/%Y")}]
      expect{ transaction.print_transactions }.to output(example_transaction).to_stdout
    end
  end
end