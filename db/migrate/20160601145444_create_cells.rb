class CreateCells < ActiveRecord::Migration
  def change
    create_table :cells, id: :uuid do |t|
      t.references :confession, type: :uuid, index: true

      t.timestamps null: false
    end
  end
end
