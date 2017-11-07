class AddThcToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :thc, :string
  end
end
