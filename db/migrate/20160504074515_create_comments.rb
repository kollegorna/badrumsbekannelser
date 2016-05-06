class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments, id: :uuid do |t|
      t.references :confession, type: :uuid, index: true

      t.string :title, null: false
      t.text   :body,  null: false

      t.timestamps null: false
    end
  end
end
