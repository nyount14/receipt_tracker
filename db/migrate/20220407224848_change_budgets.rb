class ChangeBudgets < ActiveRecord::Migration[6.1]
  def change
    change_column :budgets, :food, :float, default: 0
    change_column :budgets, :fuel, :float, default: 0
    change_column :budgets, :fun, :float, default: 0
    change_column :budgets, :gifts, :float, default: 0
    change_column :budgets, :misc, :float, default: 0
  end
end
