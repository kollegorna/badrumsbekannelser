ActiveAdmin.register User do
  actions :index, :new, :show, :edit, :create, :update

  filter :username
  filter :family
  filter :first_name
  filter :last_name
  filter :created_at
  filter :updated_at

  permit_params :email, :password, :password_confirmation, :family_id,
                :first_name, :last_name, :username,
                :birthdate

  config.sort_order = 'created_at_desc'

  index do
    id_column

    column :username
    column :family
    column :first_name
    column :last_name
    column :birthdate
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :id
      row :username
      row :family
      row :first_name
      row :last_name
      row :birthdate
      row :created_at
      row :updated_at
    end

    panel 'Confessions' do
      table_for user.confessions do
        column(:id) { |confession| link_to confession.id, admin_confession_path(confession) }
        column(:body) { |confession| simple_format confession.body }
        column :created_at
        column :updated_at
      end
    end
  end

  form do |f|
    f.inputs 'User' do
      if f.object.new_record?
        f.input :family, hint: "Family not in the list? Add one #{link_to 'here',  new_admin_family_path}.".html_safe
      else
        f.input :family, include_blank: false
      end
      f.input :username
      f.input :first_name
      f.input :last_name
      f.input :birthdate, start_year: 1900, end_year: Time.zone.now.year
    end

    f.inputs 'Password' do
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end
end
