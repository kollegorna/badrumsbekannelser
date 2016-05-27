class AddExcerptToConfessions < ActiveRecord::Migration
  def change
    add_column :confessions, :excerpt, :text
  end
end
