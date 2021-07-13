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

    def update_balance_on_delete(transaction)
        if transaction.kind == true
            if self.balance >= transaction.amount
            self.balance = self.balance - transaction.amount
            self.save
            else
                return "transaction failed"
            end
        elsif transaction.kind == false
            self.balance = self.balance + transaction.amount
            self.save
        end
    end

end
