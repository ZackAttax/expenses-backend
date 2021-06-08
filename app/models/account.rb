class Account < ApplicationRecord
    has_many :transactions
    validates :name, presence: true
    validates :amount, presence: true
end
