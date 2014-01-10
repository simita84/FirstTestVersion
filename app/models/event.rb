class Event < ActiveRecord::Base
  # attr_accessible :title, :body
  
  attr_accessible :eventphoto,:name,:datetime,:duration,:address,:description,:admin_username
  
  has_attached_file :eventphoto, :styles => { :medium => "500x500>", :thumb => "100x100>" }
  
  
  belongs_to :admin
  has_many :invitees
  
  
  
   
      validates_presence_of :name,:message=>"The title cannot be blank"
       validates_presence_of :description,:message=>"The content cannot be blank"
        
  
  
end
