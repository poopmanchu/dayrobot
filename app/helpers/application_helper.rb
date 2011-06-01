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
	
	def tagger(raw_entry)
		
		tagged_entry = raw_entry
		
		@user.tags.find_each do |tag_row|
			tag = tag_row.tag
			tagged_entry = tagged_entry.gsub(/\b(#{tag})\b/i, "<a href='\\\\tags\\\\#{tag_row.id}' class='tagged'>\\1</a>")
		end
		
		return tagged_entry
	end

end
