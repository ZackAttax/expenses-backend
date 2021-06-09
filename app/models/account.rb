class Account < ApplicationRecord
    has_many :transactions
    validates :name, presence: true
    validates :balance, presence: true

    def update_balance(transactions)
        if transaction.kind == true
            self.balance = self.balance + transactions.amount
            save
        elsif transactions.kind == false
            if self.balance >= transactions.amount
            self.balance = self.balance - transactions.amount
            self.save
            else
               return "transaction failed"
            end
        end
    end
end
