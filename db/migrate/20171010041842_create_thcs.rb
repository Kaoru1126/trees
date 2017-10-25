class CreateThcs < ActiveRecord::Migration[5.0]
  def change
    create_table :thcs do |t|
      t.string         :thc
      t.string         :cbd
      t.timestamps
    end
  end
end
