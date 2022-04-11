class CreateTransactionReasons < ActiveRecord::Migration[6.1]
  def change
    create_table :transaction_reasons do |t|
      t.integer :transaction_id
      t.integer :reason_id
      t.timestamps
    end
  end
end
