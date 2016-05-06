ActiveAdmin.register User do
  filter :email
  filter :family
  filter :created_at
  filter :updated_at

  permit_params :email, :password, :family_id

  index do
    id_column

    column :family
    column :email
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs 'User' do
      f.input :family
      f.input :email, required: true

      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end

    f.actions
  end

end
