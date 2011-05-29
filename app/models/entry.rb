class Entry < ActiveRecord::Base
	attr_accessible :content, :entry_date
	
	belongs_to :user
	
	default_scope :order => 'entries.created_at DESC'
	
	before_save :parse_date
	
	def parse_date
		
	end
	
end
