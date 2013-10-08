

class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer "index" ,:null=>false
      t.string  "name" ,:null=>false
      t.text "content" 
      t.integer "member_id", :null=>false

      t.timestamps
    end
    add_index("recipes","member_id")
  end
end
