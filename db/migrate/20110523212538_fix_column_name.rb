class FixColumnName < ActiveRecord::Migration
  def self.up
  	rename_column :entries, :subject, :entry_date
  end

  def self.down
  end
end
