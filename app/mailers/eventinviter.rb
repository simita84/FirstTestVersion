class Eventinviter < ActionMailer::Base
  default :from => "rajmj83@gmail.com"

   def eventinvite(invitees,event) 
     @invitees = invitees
     @event = event
     #@url  = "http://localhost:3000/invitees?event_id=#{@event.id}"
     #@url  = "http://localhost:3000/eventdetails?event_id=#{@event.id}"

      if Rails.env.development?
       @url = "http://localhost:3000/eventdetails?event_id=#{@event.id}"
      else
       @url = "https://<changeme>.herokuapp.com/eventdetails?event_id=#{@event.id}"
      end 


     emails = @invitees.collect(&:email).join(",")
  #  def eventinvite 
     @invitees.each  do |mem|
       #mail( :to => emails, :reply_to => 'momsntotsbayarea@gmail.com', :subject => "Invite from Momsntots")
       mail( :to => emails, :reply_to => 'momsntotsbayarea@gmail.com', :subject => "Greetings !! You have been invited to #{@event.name}")
      end 
   end
end
