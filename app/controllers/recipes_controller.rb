class RecipesController < ApplicationController
  
  layout 'admin'
   before_filter :confirm_logged_in,:except => [:login,:attempt_login]
   
   def index
     list
     render('list')
   end

   def list
     @recipes=Recipe.order("recipes.created_at DESC")
   end


  

  def update
       #Find the object using form parameters
       @recipe=Recipe.find(params[:id])
       #update with new values
       @recipe.update_attributes(params[:recipe])
       #Save the object
       if @recipe.save
         #If update succeeds redirect to list 
         flash[:notice]= "Recipe --"+@recipe.title+"--updated successfully"
         redirect_to(:action=>'list')
       else
          flash[:notice]= "Recipe"+ @recipe.title+" cannot be updated. "
         render('new')
       end
       end

       def delete
         #Find the object using form parameters
         @recipe=Recipe.find(params[:id])
         end
       def destroy
            #Find the object using form parameters
            @recipe=Recipe.find(params[:id])
             if @recipe.destroy
               flash[:notice]="Recipe   "+@recipe.title+" deleted successfully"
                redirect_to(:action =>'list')  
                else
                   flash[:notice]="Recipe   "+@recipe.title+" cannot be deleted"   
             end
       end

        
  
  
  
end
