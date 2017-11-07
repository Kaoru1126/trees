class AddFavcounterToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :fav_counts, :integer, :default => 0
  end
end
