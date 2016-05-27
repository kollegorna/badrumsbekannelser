class CreateMirrors < ActiveRecord::Migration
  def change
    create_table :mirrors, id: :uuid do |t|
      t.references :family, type: :uuid, index: true

      t.string  :name,   null: false
      t.boolean :on,     null: false, default: false

      t.timestamps null: false
    end

    add_index :mirrors, :name, unique: true
  end
end
