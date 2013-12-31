class CreateEvents < ActiveRecord::Migration
  def self.up
      # instructions for changing db to new state
       create_table :events do |t|
        t.string "name", :limit => 150
        t.datetime "datetime"
        t.string "duration", :limit => 150
        t.string "address", :limit => 300
        t.text "description"
        t.timestamps
       end
    end   

     def self.down
      # instratuction for changing db back to previous state
      drop_table :events
    end
end
