module ApplicationHelper
	def sortable(column, title = nil)
  	title ||= column.titleize
  	if column == sort_column
  		css_class = "sort sort__active sort--#{sort_direction}"
  	else 
  		css_class = "sort"
  	end
  	direction = 
  	if column == sort_column && sort_direction == "asc"
  		direction = "desc"
  	else
  		direction = "asc"
  	end
  		link_to title, {:sort => column, :direction => direction, :nom =>params[:nom], :prenom=>params[:prenom], :email=>params[:email]}, {:class => css_class}

	end

end
