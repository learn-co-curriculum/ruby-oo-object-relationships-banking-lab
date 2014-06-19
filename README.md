---
  tags: oo, object relations, classes, intermediate
  languages: ruby
  resources: 0
---

# Object Oriented Banking

## Objective

We're going to build a BankAccount class where two instances of the class can transfer money to another class through a Transfer class. The transfer class acts as a holder space for a transaction between to instances of the bank account class. Think of it this way: you can't just transfer money to another acount without the bank running checks first (if you have enough money in the account, if the person you're transferring to accepts the transfer). Transfer will do all of this, as well as check the validity of the accounts before the transaction occurs.

## Instructions

Let the tests guide your design.

## Bonus

Add functionality to BankAccount class so that every method/action must require a pin. The pin should be setable, but private and not accessible. Read up on `private` methods which will help with this.