class AddPositionToCells < ActiveRecord::Migration
  def change
    add_column :cells, :position, :integer
  end
end
