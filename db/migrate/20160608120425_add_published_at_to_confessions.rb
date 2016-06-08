class AddPublishedAtToConfessions < ActiveRecord::Migration
  def change
    add_column :confessions, :published_at, :datetime
  end
end
