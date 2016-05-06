ActiveAdmin.register Family do
  permit_params :name

  index do
    id_column

    column :name
    column :users_count
    column :created_at
    column :updated_at

    actions
  end
end
