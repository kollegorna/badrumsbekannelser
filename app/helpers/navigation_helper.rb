module NavigationHelper
  def nav_link(name, url, html_options = nil)
    class_name = current_page?(url) ? 'current' : ''

    content_tag(:li, class: class_name) do
      link_to name, url, html_options
    end
  end
end
