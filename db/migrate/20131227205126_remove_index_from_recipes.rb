class RemoveIndexFromRecipes < ActiveRecord::Migration
  def self.up
    remove_column("recipes","index")
  end

  def self.down
    add_column("recipes,index")
  end
end


