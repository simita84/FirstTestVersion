class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :admin
  
  
  
   
      validates_presence_of :name,:message=>"The title cannot be blank"
       validates_presence_of :description,:message=>"The content cannot be blank"
        
  
  
end
