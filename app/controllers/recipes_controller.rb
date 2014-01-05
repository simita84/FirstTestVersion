class RecipesController < ApplicationController
  
  layout 'admin'
   before_filter :find_recipe
   before_filter :confirm_logged_in,:except => [:login,:attempt_login]
   
   def index
     list
     render('list')
   end

   def list
     @recipes=Recipe.order("recipes.created_at DESC")
   end
  
   def listRecipes
      @recipes=Recipe.order("recipes.created_at DESC").where(:id=>@recipe.id)
     
   end
   
   
   def new
     @recipe=Review.new
   end
   
   def create
     @recipe=Recipe.new(params[:recipe]) 
      @recipe.update_attributes(:member_username=>session[:username])
     #Save the object
       if @recipe.save
     #If save succeeds redirect to list 
     flash[:notice]= "Recipe --"+@recipe.title+"--created successfully"
       redirect_to(:action=>'list')
     #else redislay the form so user can fix the problem
       else
         flash[:notice]= "Recipe  "+ @recipe.title+"  cannot be added. "
           render('new')
       end
   end
   
    
   
   
   
   
   
   
   
   
   
 
 def edit
   
   @recipe=Recipe.find(params[:id])
   
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

        
  
        private 

        def find_recipe
          if (params[:id])
            @recipe=Recipe.find_by_id(params[:id])
        end
      end
  
  
  
  
end
