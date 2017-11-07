class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string         :productName, null: false, index:true, unique:true
      t.string         :productImage
      t.string         :dominant
      t.timestamps
    end
  end
end
