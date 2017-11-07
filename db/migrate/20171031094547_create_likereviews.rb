class CreateLikereviews < ActiveRecord::Migration[5.0]
  def change
    create_table :likereviews do |t|
      t.references  :user,   index: true, null: false, foreign_key: true
      t.references  :review,  index: true, null: false, foreign_key: true
      t.timestamps
    end
  end
end
