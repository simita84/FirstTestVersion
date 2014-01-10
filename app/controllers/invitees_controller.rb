class InviteesController < ApplicationController
 
   layout 'admin'
  before_filter :find_event
 

    def index
       
      @invitees = Invitee.where(:event_id => @event.id, :invited => false)
      @invitedinvitees = Invitee.where(:event_id => @event.id, :invited => true)
    end
 


   def eventinfo
   # @invitees = Invitee.where(:event_id => @event.id)
    @invitedinvitees = Invitee.where(:event_id => @event.id, :invited => true)
    @events = Event.where(:id => @event.id)
    @invitee = Invitee.where(:event_id => @event.id, :invited => true, :email => session[:email_id]).first

   end 



    def new
      @events = Event.all
      @invitee = Invitee.new(:event_id => @event.id)

    end


    def create
        # Instantiate a new object using form parameters
        @invitee = Invitee.new(params[:invitee])
        # Save the object
        if @invitee.save
          # If save succeeds, redirect to the list action
          flash[:success] = "********* Invitee Added ************"
          redirect_to(:action => 'index', :event_id => @invitee.event_id)
        else
          # If save fails, redisplay the form so user can fix problems
          #@event_count = Event.count + 1
          flash[:notice] = "Sorry, Event cannot  be created, Please check the fields and try again"
          @error_message = "It seems there was a validation error. Please try again."
          render('new')
        end
    end
    
    
    def editInvitee
      #Find the object using form parameters
       @invitee=Invitee.find(params[:id])
    end
     def updateInvitee
        #Find the object using form parameters
        @invitee=Invitee.find(params[:id])
        #update with new values
        @invitee.update_attributes(params[:invitee])
        #Save the object
        if @invitee.save
          #If update succeeds redirect to list 
          flash[:notice]= "Invitee --"+@invitee.email+"--updated successfully"
          redirect_to(:action=>'index', :event_id => @invitee.event_id)
        else
           flash[:notice]= "Invitee"+ @invitee.email+" cannot be updated. "
          render('new')
        end
      end
    
        
        def deleteInvitee
           #Find the object using form parameters
           @invitee=Invitee.find(params[:id])
           end
         def destroyInvitee
              #Find the object using form parameters
              @invitee=Invitee.find(params[:id])
               if @invitee.destroy
                 flash[:notice]="Invitee   "+@invitee.email+" deleted successfully"
                  redirect_to(:action =>'index')  
                  else
                     flash[:notice]="Invitee   "+@item.email+" cannot be deleted"   
               end
         end
        
      
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
    
    

    def sendEventInvite
      @invitees = Invitee.where(:event_id => @event.id, :invited => false)
      ## message = "Email sent!"
        if @invitees && @event
          Eventinviter.eventinvite(@invitees,@event).deliver
        end 
        flash[:success] = "********* Email Sent ************"

          @invitees.each do |invitee|
          invitee.update_attributes(:invited => true)
      end  

    end 
 

    def memberResponseHandler
      @invitee = Invitee.find(params[:id])
      @invitee.update_attributes(params[:invitee])
      @invitee.responded = true
      @invitee.save
      redirect_to(:action => 'eventinfo', :event_id => @event.id)
     
    end  




  private

  def find_event
    if params[:event_id]
      @event = Event.find_by_id(params[:event_id])
    end
  end
  
  


  
end
