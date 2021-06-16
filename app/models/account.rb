class Account < ApplicationRecord
    has_many :transactions
    validates :name, presence: true
    validates :balance, presence: true

    def update_balance(transaction)
        if transaction.kind == true
            self.balance = self.balance + transaction.amount
            self.save
        elsif transaction.kind == false
            if self.balance >= transaction.amount
            self.balance = self.balance - transaction.amount
            self.save
            else
               return "transaction failed"
            end
        end
    end
end
