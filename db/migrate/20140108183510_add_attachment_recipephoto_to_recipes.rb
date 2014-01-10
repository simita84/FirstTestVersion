class AddAttachmentRecipephotoToRecipes < ActiveRecord::Migration
  def self.up
    change_table :recipes do |t|
      t.attachment :recipephoto
    end
  end

  def self.down
    drop_attached_file :recipes, :recipephoto
  end
end
