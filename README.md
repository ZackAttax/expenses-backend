# README

This is the backend for an expense tracker

You can create Accounts with a starting balance

Create transactions belonging to an account to change the balance. If it's a withdrawel and there are insufficient funds it won't go through.

Deleting a tranaction will reverse the transaction. If it is a deposit the funds must be available for it to be reverese

Data is serialized using Rails built in seriliazer




Rails version             6.1.3.2
Ruby version              ruby 2.6.1p33 (2019-01-30 revision 66950) [x86_64-darwin20]
RubyGems version          3.2.7
Rack version              2.2.3