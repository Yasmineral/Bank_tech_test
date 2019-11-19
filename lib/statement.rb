require_relative 'account'

class Statement

  
  def initialize
  end

  def display_header
    print "date || credit || debit || balance"
  end

  def print(array)
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
