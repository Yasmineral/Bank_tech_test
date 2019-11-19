require_relative 'statement'

class Account

  attr_accessor :total_balance, :transaction, :debit, :credit, :transactions, :statement
  
    def initialize(statement = Statement.new)
      @total_balance = 0
      @credit = 0
      @debit = 0
      @transactions = []
      @statement = statement
    end
  
    def deposit(amount)
      @total_balance += amount
      @credit = amount
      add_transaction
    end
  
    def withdraw(amount)
      fail "Insufficient funds" if @total_balance < amount
      @total_balance -= amount
      @debit = amount
      add_transaction
    end

    def add_transaction
      transaction = { credit: @credit, debit: @debit, balance: @total_balance, date: Time.now.strftime("%d/%m/%Y") }
      @transactions << transaction
      reset
    end

    def print_statement
      @statement.generate_statement(@transactions)
    end

    def reset
      @credit = 0
      @debit = 0
    end
  end