class AddReviewcounterToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :review_counts, :integer, :default => 0
  end
end
