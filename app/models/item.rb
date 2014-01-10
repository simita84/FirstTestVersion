class Item < ActiveRecord::Base
  # attr_accessible :title, :body
  
  attr_accessible :itemphoto,:name, :content,:member_username
   has_attached_file :itemphoto, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  
  
    belongs_to :member
    
     
      validates_presence_of :name,:message=>"The name cannot be blank"
           validates_presence_of :content,:message=>"The content cannot be blank"
           
    
    
end
