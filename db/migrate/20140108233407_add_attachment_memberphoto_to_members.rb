class AddAttachmentMemberphotoToMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.attachment :memberphoto
    end
  end

  def self.down
    drop_attached_file :members, :memberphoto
  end
end
