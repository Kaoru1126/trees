class CreateDominants < ActiveRecord::Migration[5.0]
  def change
    create_table :dominants do |t|
      t.string         :dominant
      t.timestamps
    end
  end
end
