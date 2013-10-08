class UpdateRecipes < ActiveRecord::Migration
  def up
    
    remove_column("recipes","name")
    add_column("recipes","title",:string,:limit=>50,:null=>false)    
  end

  def down
    
       remove_column("recipes","title")
        add_column("recipes","name",:null=>false)
    
  end
end
