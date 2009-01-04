class AddDescriptionToPhotobook < ActiveRecord::Migration
  def self.up
    add_column :photobooks, :description, :text
  end

  def self.down
    remove_column :photobooks, :description
  end
end
