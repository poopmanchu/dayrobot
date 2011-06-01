class MakeUserIdsIntegers < ActiveRecord::Migration
  def self.up
  
	  change_column(:entries, :user_id, :integer)
	  change_column(:tags, :user_id, :integer)
  
  end

  def self.down
  
	  change_column(:entries, :user_id, :string)
	  change_column(:tags, :user_id, :string)
  
  end
end
