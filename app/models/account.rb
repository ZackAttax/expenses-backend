class Account < ApplicationRecord
    has_many :transactions
    validates :name, presence: true
    validates :balance, presence: true
end
