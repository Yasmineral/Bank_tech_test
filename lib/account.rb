require_relative 'transaction'

class Account

  attr_accessor :total_balance, :transaction
  
    def initialize(transaction = Transaction.new)
      @total_balance = 0
      @transaction = transaction
      @credit = 0
      @debit = 0
    end
  
    def deposit(amount)
      @total_balance += amount
      @credit = amount
      @transaction.record_transaction(@total_balance, @credit)
    end
  
    def withdraw(amount)
      fail "Insufficient funds" if @total_balance < amount
      @total_balance -= amount
      @transaction.debit = amount
      @transaction.record_transaction(@total_balance)
    end
  end