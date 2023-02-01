class UpdateUsersTable < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :photo, :string, null: true, default: "https://cdn.dribbble.com/users/9685/screenshots/997495/avatarzzz.gif"
    add_index :users, :name, unique: true
  end
end
