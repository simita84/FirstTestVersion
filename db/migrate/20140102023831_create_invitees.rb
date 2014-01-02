class CreateInvitees < ActiveRecord::Migration
  
  
  def self.up
      create_table :invitees do |t|
        t.string "email",:limit=>100
        t.integer "event_id",:null=>false
        t.string "firstname", :limit => 30
        t.boolean "invited",:default => false
        t.boolean "responded", :default => false
        t.string "response",:default => "No"
        t.integer "adults"
        t.integer "kids"
        t.text "message",:limit => nil
        t.timestamps
      end
    end

    def self.down
      drop_table :invitees 
    end

end
