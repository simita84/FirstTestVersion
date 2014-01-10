class AddAttachmentEventphotoToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :eventphoto
    end
  end

  def self.down
    drop_attached_file :events, :eventphoto
  end
end
