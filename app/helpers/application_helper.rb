module ApplicationHelper
    
  def sortable(column, title = nil)
    title ||= column.titleize
    album_col_link = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => album_col_link}
  end

end
