class CreateMembers < ActiveRecord::Migration
  
  def change
    create_table :members do |t|
      t.string "emailid",:limit=>25,:null=>false
      t.string "first_name",:limit=>50,:null=>false
      t.string "last_name",:limit=>50,:null=>false
      t.string "hashed_password",:limit=>40,:null=>false
      t.string "salt"
      t.timestamps
    end
     add_index("members","emailid")
  end
  def down
    drop_table :members
  end
  
end
