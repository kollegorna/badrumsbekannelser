ActiveAdmin.register Confession do
  actions :index, :show, :edit, :update

  filter :body
  filter :featured
  filter :created_at

  permit_params :excerpt, :featured,
                comment_attributes: [:id, :title, :body, :_destroy]

  config.sort_order = 'created_at_desc'

  index do
    id_column

    column :family do |c|
      c.user.family.name
    end

    column :user do |c|
      c.user.email
    end

    column :body
    column :featured
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
      f.input :excerpt
      f.input :featured
    end

    f.inputs 'Comment', for: [:comment, f.object.comment || Comment.new] do |c|
      c.input :title
      c.input :body

      c.input :_destroy, as: :boolean, label: 'Remove' unless c.object.new_record?
    end

    f.actions
  end

  controller do
    def update
      params[:confession].delete(:comment_attributes) if
        params[:confession][:comment_attributes][:title].blank? &&
        params[:confession][:comment_attributes][:title].blank?

      super
    end
  end
end
