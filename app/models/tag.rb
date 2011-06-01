class Tag < ActiveRecord::Base

	attr_accessible :tag
	
	belongs_to :user

end
