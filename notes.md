Account
has_many :transactions
:balance float, :name string


Transactions
belongs_to :account
:account_id integer, :amount float, :kind - boolean, :date - datetime, :description string