class RemoveFeaturedOnConfessions < ActiveRecord::Migration
  def change
    remove_column :confessions, :featured
  end
end
