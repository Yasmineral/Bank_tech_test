require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  header = "date || credit || debit || balance\n"
  transactions = [{credit: 200, debit: 0, balance: 200, date: "20/11/2019"}]
  printed_statement = "date || credit || debit || balance\n20/11/2019 || 200.00 || || 200.00\n"
  printed_row = "20/11/2019 || || 100.00 || 50.00\n"

  describe "#display_header" do
    it "displays the header with correct spacing" do
      expect{ statement.display_header }.to output(header).to_stdout
    end
  end

  describe "#generate_statement" do
    it "prints out the array of transactions" do
      expect{ statement.generate_statement(transactions) }.to output(printed_statement).to_stdout
    end
  end

  describe "#display_row" do
    it "displays a blank space if credit equals 0" do
      expect {statement.display_row(0, 100, 50, "20/11/2019") }.to output(printed_row).to_stdout
    end
  end
end