class AddUserIdToFoodBudgets < ActiveRecord::Migration[6.1]
  def change
    add_column :food_budgets, :user_id, :int
  end
end
