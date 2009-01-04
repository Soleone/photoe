class AddUserIdToPhotobook < ActiveRecord::Migration
  def self.up
    add_column :photobooks, :user_id, :integer
  end

  def self.down
    remove_column :photobooks, :user_id
  end
end
