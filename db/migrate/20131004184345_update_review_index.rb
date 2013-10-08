class UpdateReviewIndex < ActiveRecord::Migration
  def self.up
    
    change_column("reviews","index",:integer,:null=>true)
  end

  def self.down
    
    change_column("reviews","index",:integer,:null=>false)
  end
end
 