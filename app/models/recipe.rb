class Recipe < ActiveRecord::Base
  # attr_accessible :title, :body
  
  
  #Mapping between Member and Recipes tables
    belongs_to :member
    
    
    
    validates_presence_of :index,:message => "The index shall not be left blank"
      validates_presence_of :title,:message=>"The title cannot be blank"
      validates_presence_of :member_emailid,:message => "The index shall not be left blank"
           validates_presence_of :content,:message=>"The content cannot be blank"
           validates_uniqueness_of :title,:message=>"Title already entered"
    
    
    
    
    
end
