class RemoveFFromEntries < ActiveRecord::Migration
  def self.up
	remove_column :entries, :from
  end

  def self.down
  	add_column :entries, :from
  end
end
