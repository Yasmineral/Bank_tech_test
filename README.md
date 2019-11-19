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
# Set up

Gemfile
* Rubocop to analyse code style
* SimpleCov to analyse code coverage

DO: bundle install gems
DO: add these lines to spec helper

'''
require 'simplecov'
require 'simplecov-console'

SimpleCov.start
SimpleCov.formatter = SimpleCov::Formatter::Console
'''


-------------------------------------
-------------------------------------
# Process

User stories
* As a customer, so that I can keep my money safe, I'd like to open a bank account
* As a customer, so that I can keep my money safe, I'd like to deposit money into my bank account
* As a customer, so that I can access my money when I need it, I'd like to withdraw from my account
* As a customer, so that I know how much money is in my account, I'd like to see my total balance
* As a customer, so that I can manage my cash flow, I'd like to see a dated statment of all deposit & withdrawls

- edgecase: no money in the account?



account.deposit(1000)
statment:
date, credit= 1000, debit= 0, balance= 1000

account.withdraw(500)
statment:
date, credit= 0, debit= 500, balance= 500

All of this information is needed for the statment, therefore should be recorded with every credit / debit.
A hash might be worth exploring here.
Hardcode dates (based on requirements of the code)

Now thinking a new class would be helpful to encapsulate the behaviour of a bank statement, which needs to record extra specific information
with every deposit & withdraw. Will also need a print method. This should not be the job of the account, which should only be inputting our outputting money.


Testing is hard. Now thinking about starting again but don't want to waste time. I'd like to explore a better way of passing information between classes. Currently, I'm unable to test that the account class updates credit / debit info in the transactions class, probably because only one class should be responsible for all the data. But when I previously tried storing all of the information in account and passing it to transactions to print, the entries came back nil. 
