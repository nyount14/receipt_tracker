class AddCategory < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :category, :string
  end
end
