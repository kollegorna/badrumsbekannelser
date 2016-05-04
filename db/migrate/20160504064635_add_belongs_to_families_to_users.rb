class AddBelongsToFamiliesToUsers < ActiveRecord::Migration
  def change
    add_belongs_to(:users, :families, type: :uuid, index: true)
  end
end
