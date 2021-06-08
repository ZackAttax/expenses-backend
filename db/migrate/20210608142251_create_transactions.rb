class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :account, null: false, foreign_key: true
      t.float :amount
      t.boolean :kind
      t.datetime :date
      t.string :description

      t.timestamps
    end
  end
end
