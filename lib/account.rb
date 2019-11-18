require_relative 'transaction'

class Account

  attr_accessor :total_balance, :transaction
  
    def initialize(transaction = Transaction.new)
      @total_balance = 0
      @transaction = transaction
    end
  
    def deposit(amount)
      @total_balance += amount
      @transaction.credit = amount
      @transaction.record_transaction(@total_balance)
    end
  
    def withdraw(amount)
      fail "Insufficient funds" if @total_balance < amount
      @total_balance -= amount
      @transaction.debit = amount
      @transaction.record_transaction(@total_balance)
    end

    def show_transactions
      @transaction.transactions
    end
  end