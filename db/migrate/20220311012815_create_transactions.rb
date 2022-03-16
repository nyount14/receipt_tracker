class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.string :t_type
      t.date :date
      t.text :description
      t.timestamps
    end
  end
end
