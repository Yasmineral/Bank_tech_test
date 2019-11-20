require_relative 'account'

class Statement

  def initialize
  end

  def display_header
    puts 'date || credit || debit || balance'
  end

  def generate_statement(array)
    display_header
    array = array.reverse
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
      debit = ''
      puts format('%s || %s ||%s || %s', date, format('%.2f', credit), debit, format('%.2f', balance))
    elsif credit == 0
      credit = ''
      puts format('%s ||%s || %s || %s', date, credit, format('%.2f', debit), format('%.2f', balance))
    end
  end
end
