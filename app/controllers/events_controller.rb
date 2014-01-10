class EventsController < ApplicationController
  
  layout 'admin'
  
    before_filter :confirm_logged_in
  
  def index
    listEvents
        render('listEvents')
  end

  def listEvents
    @events=Event.order("events.created_at DESC").paginate(page: params[:page],per_page: 10)       
  end
  def showEvents
      @event = Event.find(params[:id])
    end

  def newEvents
      @event = Event.new
      @event_count = Event.count + 1
      
    end

  def createEvents
    # Instantiate a new object using form parameters
        @event = Event.new(params[:event])
         @event.update_attributes(:admin_username=>session[:username])
        # Save the object
        if @event.save
          # If save succeeds, redirect to the list action
          flash[:notice] = "********* Event created ************"
          redirect_to(:action => 'listEvents')
        else
          # If save fails, redisplay the form so user can fix problems
          #@event_count = Event.count + 1
          flash[:notice] = "********* Event not created ************"
          #@error_message = "It seems there was a validation error. Please try again."
          render('newEvents')
        end
  end
  
  
  
  

  def editEvents
      @event = Event.find(params[:id])
     
    end
    
    
    def updateEvents
          @event = Event.find(params[:id])
        # Save the object
        if @event.update_attributes(params[:event])
          # If save succeeds, redirect to the list action
          flash[:notice] = "********* Event saved ************"
         # redirect_to(:action => 'show', :id => @event.id )
         redirect_to(:action => 'listEvents')
        else
          # If save fails, redisplay the form so user can fix problems
          #@event_count = Event.count + 1
          render('editEvents')
        end

      end
    
    
      def deleteEvents
         @event = Event.find(params[:id])
       end  


       def destroyEvents
         Event.find(params[:id]).destroy
         flash[:notice] = "********* Event destroyed ************"
         redirect_to(:action => 'listEvents')

       end

  
end
