class ChangeColumnNameInTransactionReasons < ActiveRecord::Migration[6.1]
  def change
    remove_column :purchase_reasons, :transaction_id
    add_column :purchase_reasons, :purchase_id, :integer
  end
end
