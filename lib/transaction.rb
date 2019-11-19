require_relative 'account'

class Transaction

  attr_accessor :debit, :credit, :transactions
  
    def initialize
      @debit = 0
      @credit = 0
      @transactions = []
      @current_balance = 0
    end
    
    def record_transaction(balance)
      @current_balance = balance
      current_transaction = {credit: @credit, debit: @debit, balance: @current_balance, date: Time.now.strftime("%d/%m/%Y")}
      @transactions << current_transaction
      reset
    end

    def reset
      @credit = 0
      @debit = 0
    end

    def print_header
      print "date || credit || debit || balance"
    end

    def print_transaction
      
    end

  end

