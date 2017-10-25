class AddNicknameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nickname, :string, :unique =>true
    add_column :users, :avatar, :string
    add_column :users, :intro, :text, :limit => 420
  end
end
