class InviteesController < ApplicationController
 
   layout 'admin'
  before_filter :find_event

    def index
      #before_filter :confirm_logged_in
      #@invitees = Invitee.where(:event_id => @event.id)
      #@invitees = Invitee.all
      #find_by_id(params[:subject_id])
      #@invitees = Invitee.find_by_event_id(:event_id)
      #working..
      #@invitees = Invitee.where(:event_id => (params[:event_id]))
      @invitees = Invitee.where(:event_id => @event.id, :invited => false)
      @invitedinvitees = Invitee.where(:event_id => @event.id, :invited => true)


      #respond_to do |format|
       # format.html # index.html.erb
        #format.json { render :json => @invitees }
      #end
      #@sections = Section.sorted.where(:page_id => @page.id)
       #@invitees = Invitee.where(:event_id => @event.id)
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

    def membersinvited
    end  

    def memberResponseHandler
      @invitee = Invitee.find(params[:id])
      @invitee.update_attributes(params[:invitee])
      @invitee.responded = true
      @invitee.save
      redirect_to(:action => 'eventinfo', :event_id => @event.id)
      #email_id = session[:email_id] 
      #@event = Event.find_by_id(params[:event_id])
      #evnt_id = @event.id
      #sql = "UPDATE `members` SET `first_name` = 'Rajamani', `updated_at` = '2013-10-06 07:35:02' WHERE `members`.`id` = 34"
      #sql = "UPDATE invitees SET response = 'Yeses' WHERE email = 'simi.tresa.antony@gmail.com' and event_id = 2"
      #sql = "UPDATE invitees SET response = '#{p}' WHERE email = '#{email_id}' and event_id = #{@event.id}"
      #sql = "UPDATE invitees SET response = 'Yes!sure' WHERE email = '#session[:email_id]' and event_id = 2"

      #ActiveRecord::Base.connection.execute(sql) 
      # If input response is "Yes"
      # Update the invitee table with response "Yes" for that event for that member
      # Update the responded flag for that event for that member
      # Prompt for number of adults for that event for that member
      # number of kids for that event for that member
      # any message... for that event for that member
    end  




  private

  def find_event
    if params[:event_id]
      @event = Event.find_by_id(params[:event_id])
    end
  end
  
  
  
end
