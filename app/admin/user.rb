ActiveAdmin.register User do
  filter :email
  filter :created_at
  filter :updated_at

  permit_params :email, :password

  index do |user|
    id_column

    column :email
    column :created_at
    column :updated_at
  end

  show do |user|
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
      f.input :email, required: true

      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end

    f.actions
  end

end
