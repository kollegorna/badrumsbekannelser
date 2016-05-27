class AddUsernameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :username, :string, null: false, default: ''

    User.find_each do |user|
      user.update_column :username, "#{user.first_name}-#{user.id[0..5]}"
    end

    add_index :users, :username, unique: true
  end

  def down
    remove_column :users, :username
  end
end
