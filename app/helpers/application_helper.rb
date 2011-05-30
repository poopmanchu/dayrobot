module ApplicationHelper

	# Return a title on a per-page basis
	def title
		base_title = "* dayrobot *"
		if @title.nil?
			base_title
		else
			"#{base_title} #{@title}"
		end
	end
	
	# highlights proper nav link
	
	def nav_link(link)
		if @title == link
			return "selected_nav_link" 
		else
			return "unselected_nav_link"
		end
	end

end
