class RemoveDateFromEntries < ActiveRecord::Migration
  def self.up
  	remove_column :entries, :entry_date
  	add_column :entries, :entry_date, :date
  end

  def self.down
  	add_column :entries, :entry_date
  	remove_column :entries, :entry_date
  end
end
