class AddSubjectToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :subject, :string
  end

  def self.down
    remove_column :entries, :subject
  end
end
