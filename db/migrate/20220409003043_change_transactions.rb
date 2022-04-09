class ChangeTransactions < ActiveRecord::Migration[6.1]
  def change
    remove_column :transactions, :t_type
  end
end