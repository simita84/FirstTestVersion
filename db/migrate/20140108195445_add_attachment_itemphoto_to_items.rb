class AddAttachmentItemphotoToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :itemphoto
    end
  end

  def self.down
    drop_attached_file :items, :itemphoto
  end
end
