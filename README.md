---
  tags: oo, object relations, classes, intermediate
  languages: ruby
  resources: 0
---

# Object Oriented Banking

## Objective

We're going to build a BankAccount class where two instances of the class can transfer money to another class through a Transfer class. The transfer class acts as a space for a transaction between two instances of the bank account class. Think of it this way: you can't just transfer money to another account without the bank running checks first. Transfer will do all of this, as well as check the validity of the accounts before the transaction occurs. Transaction should be able to reject a transfer if the accounts aren't valid or if the sender doesn't have the money.

Transfers start out in a "pending" state. They can be executed and go to a "complete" state. They can also go to a "rejected" state. A completed transfer can also be reversed and go into a "reversed" state.

## Instructions

Pass the tests. They are deliberatively vague; your design is up to you.
