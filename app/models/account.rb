class Account < ApplicationRecord
    has_many :transactions
    validates :name, presence: true
    validates :balance, presence: true

    def update_balance(transactions)
        if transaction.kind
            balance = balance + transactions.amount
            save
        elsif
            if balance > transactions.amount
            balance = balance - transactions.amount
            save
            else
               return "transaction failed"
            end
        end
    end
end
