ActiveAdmin.register Confession do
  actions :index, :show, :edit, :update, :destroy

  filter :body
  filter :created_at

  permit_params :excerpt,
                comment_attributes: [:id, :title, :body, :_destroy]

  config.sort_order = 'created_at_desc'

  index do
    id_column

    column :family do |c|
      c.user.family.name
    end

    column :user do |c|
      link_to c.user.username, admin_user_path(c.user)
    end

    column :body

    column :comment do |c|
      c.comment ? status_tag(:yes) : status_tag(:no)
    end

    column 'Featured' do |confession|
      if confession.featured?
        status_tag(:yes)
      else
        button_to 'Add as featured', feature_admin_confession_path(confession), method: :post, confirm: 'Are you sure?'
      end
    end

    column :created_at

    actions
  end

  form do |f|
    f.inputs 'Confession' do
      f.input :user, input_html: { disabled: true }
      f.input :body, input_html: { disabled: true }
      f.input :excerpt
    end

    f.inputs 'Comment', for: [:comment, f.object.comment || Comment.new] do |c|
      c.input :title
      c.input :body

      c.input :_destroy, as: :boolean, label: 'Remove' unless c.object.new_record?
    end

    f.actions
  end

  member_action :feature, method: :post do
    cell = Cell.new(confession: resource)
    if cell.save
      redirect_to admin_confessions_path, notice: "#{resource.id} has been featured successfully"
    else
      redirect_to admin_confessions_path, flash: {error: cell.errors.full_messages.first }
    end
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
