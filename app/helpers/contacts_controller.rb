class ContactsController < ApplicationController
  layout 'admin'
  
  
  def list
     @contacts=Contact.all
   end

  def edit
     #Find the object using form parameters
     @contact=Contact.find(params[:id])
     end

  def update
       #Find the object using form parameters
       @contact=Contact.find(params[:id])
       #update with new values
       @contact.update_attributes(params[:contact])
       #Save the object
       if @contact.save
         #If update succeeds redirect to list 
         flash[:notice]= "contact --"+@contact.name+"--updated successfully"
         redirect_to(:action=>'list')
       else
          flash[:notice]= "contact"+ @contact.name+" cannot be updated. "
         render('new')
       end
       end
 
end
