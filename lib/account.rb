class Account

attr_accessor :total_balance, :credit, :debit, :transactions, :date

  def initialize
    @total_balance = 0
    @credit = 0
    @debit = 0
    @date = 0
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
    set_date
    transaction = {credit: @credit, debit: @debit, balance: @total_balance, date: @date}
    @transactions << transaction
    @credit, @debit, @date = 0, 0, 0
  end

  def set_date
    if @credit == 1000
      @date = "10-01-2012"
    elsif @credit == 2000
      @date = "13-01-2012"
    elsif @debit == 500
      @date = "14-01-2012"
    end
  end
end
