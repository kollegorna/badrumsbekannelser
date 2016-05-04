class AddUsersCountToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :users_count, :integer, null: false, default: 0
  end
end
