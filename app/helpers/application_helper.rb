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
			#tag = @user.tags.find_by_id(1).tag
			tag = tag_row.tag
			tagged_entry = tagged_entry.gsub(/\b(#{tag})\b/i, "<span class='tagged'>\\1</span>")
		end
		
		return tagged_entry
	end

end
