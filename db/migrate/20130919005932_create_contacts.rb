class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string "name" ,:null=>false,:limit=>25
      t.string "emailid",:null=>false
      t.string "facebook",:null=>false
      t.timestamps
    end
  end
end
