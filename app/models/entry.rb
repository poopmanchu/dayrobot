class Entry < ActiveRecord::Base
	attr_accessible :content, :entry_date
	
	belongs_to :user
	
	default_scope :order => 'entries.created_at DESC'
	
end
