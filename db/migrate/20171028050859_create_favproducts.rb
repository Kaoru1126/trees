class CreateFavproducts < ActiveRecord::Migration[5.0]
  def change
    create_table :favproducts do |t|
      t.references  :user,   index: true, null: false, foreign_key: true
      t.references  :product,  index: true, null: false, foreign_key: true
      t.timestamps
    end
  end
end
