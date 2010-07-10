class RemoveNoteFromResearch < ActiveRecord::Migration
  def self.up
    remove_column :researches, :note 
  end

  def self.down
  end
end
