class AddBelongsToFamiliesToUsers < ActiveRecord::Migration
  def change
    add_belongs_to(:users, :family, type: :uuid, index: true)
  end
end
