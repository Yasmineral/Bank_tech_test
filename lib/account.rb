class Account

attr_accessor :total_balance, :credit, :debit, :transactions

  def initialize
    @total_balance = 0
    @credit = 0
    @debit = 0
    @transactions = []
  end

  def deposit(amount)
    @credit += amount
    @total_balance += amount
    record_transaction
  end

  def withdraw(amount)
    fail "Insufficient funds" if @total_balance < amount
    @debit = amount
    @total_balance -= amount
    record_transaction
  end

  def record_transaction
    transaction = {credit: @credit, debit: @debit, balance: @total_balance}
    @transactions << transaction
    @credit, @debit = 0, 0
  end
end
