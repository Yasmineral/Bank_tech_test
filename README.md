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

# Installation

download the repo into your Projects folder using:

```
git clone ghttps://github.com/Yasmineral/Bank_tech_test.git
```

change into the banking directory, then run:

```
bundle install
```

to install dependencies.

# Testing

Within the project folder, run tests & view test coverage with the following command:

```rspec```


I used Rubocop to anaylse code style and Simplecov to asses code coverage. Tests are currently all passing with coverage at 100% and zero offense listed.




