class AddUserIdIndexToEntries < ActiveRecord::Migration
  def self.up
  	add_index :entries, :user_id
  end

  def self.down
  	remove_index :entries, :user_id
  end
end
