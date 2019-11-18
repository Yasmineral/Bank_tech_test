# Bank tech test

## Specification

### Requirements

* You should be able to interact with your code via a REPL 
* Deposits, withdrawal
* Account statement (date, amount, balance) printing
* Data can be kept in memory (as opposed to a database)

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```


-------------------------------------
-------------------------------------
Gemfile
* Rubocop to analyse code style
* SimpleCov to analyse code coverage

DO: bundle install gems
DO: add these lines to spec helper

'''
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
'''

User stories
* As a customer, so that I can keep my money safe, I'd like to open a bank account
* As a customer, so that I can keep my money safe, I'd like to deposit money into my bank account
* As a customer, so that I can access my money when I need it, I'd like to withdraw from my account
* As a customer, so that I know how much money is in my account, I'd like to see my total balance
* As a customer, so that I can manage my cash flow, I'd like to see a dated statment of all deposit & withdrawls

account.deposit(1000)
statment:
date, credit= 1000, debit= 0, balance= 1000

account.withdraw(500)
statment:
date, credit= 0, debit= 500, balance= 500

All of this information is needed for the statment, therefore should be recorded with every credit / debit.
A hash might be worth exploring here.


