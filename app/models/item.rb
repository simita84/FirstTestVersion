class Item < ActiveRecord::Base
  # attr_accessible :title, :body
    belongs_to :member
    
    validates_presence_of :index,:message => "The index shall not be left blank"
      validates_presence_of :name,:message=>"The name cannot be blank"
           validates_presence_of :content,:message=>"The content cannot be blank"
           
    
    
end
