class HomesController < ApplicationController
  
  layout 'admin'
    before_filter :confirm_logged_in,:except => [:login,:attempt_login]
  
  def list
     @homes=Home.all
   end

   
  
  def edit
     #Find the object using form parameters
     @home=Home.find(params[:id])
     end

  def update
       #Find the object using form parameters
       @home=Home.find(params[:id])
       #update with new values
       @home.update_attributes(params[:home])
       #Save the object
       if @home.save
         #If update succeeds redirect to list 
         flash[:notice]= "Home --"+@home.title+"--updated successfully"
         redirect_to(:action=>'list')
       else
          flash[:notice]= "Home"+ @home.title+" cannot be updated. "
         render('new')
       end
       end
  
  
  
end
