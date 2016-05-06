class CreateConfessions < ActiveRecord::Migration
  def change
    create_table :confessions, id: :uuid do |t|
      t.references :user,    type: :uuid, null: false, index: true

      t.text       :body,     null: false
      t.boolean    :featured, null: false, default: false

      t.timestamps null: false
    end
  end
end
