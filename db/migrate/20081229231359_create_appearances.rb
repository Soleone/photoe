class CreateAppearances < ActiveRecord::Migration
  def self.up
    create_table :appearances do |t|
      t.integer :photo_id
      t.integer :photobook_id

      t.timestamps
    end
  end

  def self.down
    drop_table :appearances
  end
end
