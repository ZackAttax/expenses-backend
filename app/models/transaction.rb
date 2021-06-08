class Transaction < ApplicationRecord
  belongs_to :account
  validates :amount, presence: true

  def deposit_or_withdraw
    if kind
      "deposit"
    else
      "withdraw"
    end
  end

end
