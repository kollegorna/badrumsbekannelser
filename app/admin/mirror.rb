ActiveAdmin.register Mirror do

  permit_params :name, :family_id, :on

  config.sort_order = 'name_desc'

  index do
    id_column

    column :family
    column :name
    column :on
    column :created_at
    column :updated_at

    actions
  end

  form do |f|
    f.inputs do
      if f.object.new_record?
        f.input :family, hint: "Family not in the list? Add one #{link_to 'here',  new_admin_family_path}.".html_safe
      else
        f.input :family, include_blank: false
      end
      f.input :name
      f.input :on, as: :radio
    end

    f.actions
  end
end
