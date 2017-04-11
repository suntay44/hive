module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end
  
  def arrow
      if params[:direction] == 'asc'
          image_tag("http://downloadicons.net/sites/default/files/sort-of-a-triangle-icon-76160.png", alt: "up arrow", size: "15x15")
      elsif params[:direction] == 'desc'
          image_tag("https://cdn0.iconfinder.com/data/icons/pixel-perfect-at-24px-volume-3/24/5001-512.png", alt: "down arrow", size: "15x15")
      else
        image_tag("https://cdn0.iconfinder.com/data/icons/pixel-perfect-at-24px-volume-3/24/5001-512.png", alt: "down arrow", size: "15x15")
              end
  end
end
