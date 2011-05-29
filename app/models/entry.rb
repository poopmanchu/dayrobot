class Entry < ActiveRecord::Base
	attr_accessible :content
	
	belongs_to :user
	
	default_scope :order => 'entries.created_at DESC'
	
end
