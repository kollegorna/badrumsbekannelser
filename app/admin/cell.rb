ActiveAdmin.register Cell do
  menu label: 'Frontpage'

  actions :index, :destroy

  config.filters = false
  config.sort_order = 'position_asc'

  index do
    column '' do
      '&#8645;'.html_safe
    end
    column :confession do |cell|
      link_to cell.confession.id, admin_confession_path(cell.confession)
    end
    column :excerpt
    column :body
    column :created_at

    actions
  end

  collection_action :position, method: :post do
    Cell.find(params[:id]).update_attribute(:position, params[:position])

    render nothing: true
  end
end
