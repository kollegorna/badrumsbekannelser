ActiveAdmin.register User do
  actions :index, :show, :edit, :create, :update

  filter :family
  filter :first_name
  filter :last_name
  filter :email
  filter :created_at
  filter :updated_at

  permit_params :email, :password, :family_id, :first_name, :last_name

  index do
    id_column

    column :family
    column :first_name
    column :last_name
    column :email
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :family
      row :first_name
      row :last_name
      row :email
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs 'User' do
      f.input :family
      f.input :first_name
      f.input :last_name
      f.input :email, required: true

      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end

    f.actions
  end

end
