class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.float :food
      t.float :fun
      t.float :fuel
      t.float :gifts
      t.float :misc
      t.integer :user_id
      t.timestamps
    end
  end
end
