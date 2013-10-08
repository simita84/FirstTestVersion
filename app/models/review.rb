class Review < ActiveRecord::Base
  # attr_accessible :title, :body
  
  #Mapping between product and Reviews tables
    belongs_to :product
      belongs_to :member
    
 
      validates_presence_of :title,:message=>"The title cannot be blank"
           validates_presence_of :content,:message=>"The title cannot be blank"

        
         
    
    
end
