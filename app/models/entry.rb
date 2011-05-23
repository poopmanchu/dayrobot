class Entry < ActiveRecord::Base

	def entry_date
		date_regex = 'what did you do today\?\s\((\d{4}-\d{2}-\d{2})\)'
		self.subject.match(date_regex)[1]
	end

end
