class ItemsController < ApplicationController
  
    layout 'admin'
    before_filter :find_item
      before_filter :confirm_logged_in,:except => [:login,:attempt_login]
     def index
       list
       render('list')
     end

     def list

      @items=Item.order("items.created_at DESC")
     end

  def listItem
      @items=Item.order("items.created_at DESC").where(:id=>@item.id)
  end

     def new

       @item=Item.new()
     end

     def create
       #Instantiate a new object using for parameters
         @item=Item.new(params[:item])
          @item.update_attributes(:member_username=>session[:username])
       #Save the object
         if @item.save
       #If save succeeds redirect to list 
       flash[:notice]= "Item --"+@item.name+"--added successfully"
         redirect_to(:action=>'list')
       #else redislay the form so user can fix the problem
         else
           flash[:notice]= "item"+ @item.name+" cannot be added. "
             render('new')
         end
     end
     def edit
       #Find the object using form parameters
       @item=Item.find(params[:id])
       end

    def update
         #Find the object using form parameters
         @item=Item.find(params[:id])
         #update with new values
         @item.update_attributes(params[:item])
         #Save the object
         if @item.save
           #If update succeeds redirect to list 
           flash[:notice]= "item --"+@item.name+"--updated successfully"
           redirect_to(:action=>'list')
         else
            flash[:notice]= "item"+ @item.name+" cannot be updated. "
           render('new')
         end
         end

         def delete
           #Find the object using form parameters
           @item=Item.find(params[:id])
           end
         def destroy
              #Find the object using form parameters
              @item=Item.find(params[:id])
               if @item.destroy
                 flash[:notice]="item   "+@item.name+" deleted successfully"
                  redirect_to(:action =>'list')  
                  else
                     flash[:notice]="item   "+@item.name+" cannot be deleted"   
               end
         end

         private 

         def find_item
           if (params[:id])
             @item=Item.find_by_id(params[:id])
         end
       end
  
end

 
