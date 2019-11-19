require_relative 'account'

class Statement

  attr_accessor :transactions
  
  def initialize
    @transactions = []
  end


  def display_header
    puts "date || credit || debit || balance"
  end

  def generate_statement(array)
    display_header
    array.each do |hash|
      credit = hash[:credit]
      debit = hash[:debit]
      balance = hash[:balance]
      date = hash[:date]
      display_row(credit, debit, balance, date)  
    end
  end

  def display_row(credit, debit, balance, date)
    if debit == 0
      debit = ""
      puts "%s || %s ||%s || %s" % [date, "%.2f" % credit, debit, "%.2f" % balance]
    elsif credit == 0
      credit = ""
      puts "%s ||%s || %s || %s" % [date, credit, "%.2f" % debit, "%.2f" % balance]
    end
  end
end
