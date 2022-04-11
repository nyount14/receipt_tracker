class RenameTransactionReasonsToPurchaseReasons < ActiveRecord::Migration[6.1]
  def change
    rename_table :transaction_reasons, :purchase_reasons
  end
end
