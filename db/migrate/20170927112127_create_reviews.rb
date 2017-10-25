class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references  :user,   index: true, null: false, foreign_key: true
      t.references  :product,  index: true, null: false, foreign_key: true
      t.text        :review, limit: 420, null: false
      t.string      :reviewImage
      t.timestamps
    end
  end
end
