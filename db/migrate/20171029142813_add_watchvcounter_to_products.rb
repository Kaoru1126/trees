class AddWatchvcounterToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :watch_counts, :integer, :default => 0
  end
end
