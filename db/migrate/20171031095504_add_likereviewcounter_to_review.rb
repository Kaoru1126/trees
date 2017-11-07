class AddLikereviewcounterToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :likereviews_counts, :integer, :default => 0
  end
end
