class AddUserIdToTransations < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :user_id, :int
  end
end
