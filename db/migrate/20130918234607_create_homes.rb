class CreateHomes < ActiveRecord::Migration
  def self.up
    create_table :homes do |t|
      t.string "title"
     t.text "content"
      t.timestamps
    end
  end
  def self.down
    
    drop_table :homes
  end
end
