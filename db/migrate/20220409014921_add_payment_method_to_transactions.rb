class AddPaymentMethodToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :payment_method, :string
  end
end
