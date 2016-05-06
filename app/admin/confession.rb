ActiveAdmin.register Confession do
  actions :index, :show, :edit

  filter :body
  filter :featured
  filter :created_at

  index do
    id_column

    column :family do |c|
      c.user.family.name
    end

    column :user do |c|
      c.user.email
    end

    column :body
    column :comment do |c|
      c.comment ? status_tag(:yes) : status_tag(:no)
    end
    column :created_at

    actions
  end

  form do |f|
    f.inputs 'Confession' do
      f.input :user, input_html: { disabled: true }
      f.input :body, input_html: { disabled: true }
      f.input :featured
    end
    f.actions
  end
end
