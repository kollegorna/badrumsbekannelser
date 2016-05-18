ActiveAdmin.register Family do
  permit_params :name

  config.sort_order = 'created_at_desc'

  index do
    id_column

    column :name
    column :users_count
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :created_at
      row :updated_at
      row :users_count
    end

    panel 'Members' do
      table_for family.users do
        column(:id) { |user| link_to user.id, admin_user_path(user) }
        column :first_name
        column :last_name
        column :email
        column :created_at
        column :updated_at
      end
    end
  end
end
