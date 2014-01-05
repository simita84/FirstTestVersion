class Invitee < ActiveRecord::Base
  # attr_accessible :title, :body
   belongs_to :event






   # validates_presence_of :email,:message=>"The Email cannot be blank"
# validates_presence_of :firstname,:message=>"The Guest Name cannot be blank"

  # validates_uniqueness_of :email,:message=>"Email already added"



end