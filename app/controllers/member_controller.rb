class MemberController < ApplicationController
 
    layout 'member'
    before_filter :find_product
    before_filter :confirm_member_logged_in
  def index
     @homes=Home.all
     render("index")
  end

  def showAccountInfo
    @member_user=Member.find_by_username(session[:username])
    # @member_user=Member.where(:username=>session[:username])
  end
 
  def listContactInfo
    @contacts=Contact.all
   end


   def listRecipes
     @recipes=Recipe.order("recipes.created_at DESC")
       #@recipes=Recipe.order("recipes.created_at ASC")
      # @recipes = Recipe.all
   end
   
   
   def newRecipes
       
        @recipe=Review.new
    end
  
   def createRecipes
     @recipe=Recipe.new(params[:recipe]) 
      @recipe.update_attributes(:member_username=>session[:username])
     #Save the object
       if @recipe.save
     #If save succeeds redirect to list 
     flash[:notice]= "Recipe --"+@recipe.title+"--created successfully"
       redirect_to(:action=>'listRecipes')
     #else redislay the form so user can fix the problem
       else
         flash[:notice]= "Recipe  "+ @recipe.title+"  cannot be added. "
           render('newRecipes')
       end
   end

    def editRecipes
        #Find the object using form parameters
        @recipe=Recipe.find(params[:id])
        @recipe_count=Recipe.count
    end
 
    def updateRecipes
         #Find the object using form parameters
         @recipe=Recipe.find(params[:id])
         #update with new values
         @recipe.update_attributes(params[:recipe])
         #Save the object
          if @recipe.save
                #If update succeeds redirect to list 
           flash[:notice]= "Recipe for --"+@recipe.title+"--updated successfully"
              redirect_to(:action=>'listRecipes',:id=>@recipe.id)
         else
           #if save fails ,rediplay the form so user can fix problems
           flash[:notice]= "Recipe for  "+ @recipe.title+" cannot be updated. "
            @recipe_count=Recipe.count
             render('editRecipes')
         end
 end
 
 
 def deleteRecipes
   #Find the object using form parameters
   @recipe=Recipe.find(params[:id])
   end
 def destroyRecipes
      #Find the object using form parameters
      @recipe=Recipe.find(params[:id])
       if @recipe.destroy
         flash[:notice]="Recipe for   "+@recipe.title+" deleted successfully"
          redirect_to(:action =>'listRecipes')  
          else
             flash[:notice]="Recipe for    "+@recipe.title+" cannot be deleted"   
       end
 end
 
  
 
 def listItems
              @items=Item.order("items.created_at DESC")
end
def newItems
             @item=Item.new
end
 
def createItems
        @item=Item.new(params[:item]) 
        @item.update_attributes(:member_username=>session[:username])
    #Save the object
        if @item.save
    #If save succeeds redirect to list 
        flash[:notice]= "Item --"+@item.name+"--created successfully"
        redirect_to(:action=>'listItems')
    #else redislay the form so user can fix the problem
        else
          flash[:notice]= "Item  "+ @item.name+"  cannot be added. "
          render('newItems')
        end
      end

def editItems
       #Find the object using form parameters
       @item=Item.find(params[:id])
       @item_count=Item.count
end

   def updateItems
        #Find the object using form parameters
        @item=Item.find(params[:id])
        #update with new values
        @item.update_attributes(params[:item])
        #Save the object
         if @item.save
               #If update succeeds redirect to list 
          flash[:notice]= "Item  --"+@item.name+"--updated successfully"
             redirect_to(:action=>'listItems',:id=>@item.id)
        else
          #if save fails ,rediplay the form so user can fix problems
          flash[:notice]= "Item "+ @item.name+" cannot be updated. "
           @item_count=Item.count
            render('editItems')
        end
end


def deleteItems
  #Find the object using form parameters
  @item=Item.find(params[:id])
  end
def destroyItems
     #Find the object using form parameters
     @item=Item.find(params[:id])
      if @item.destroy
        flash[:notice]="Item "+@item.name+" deleted successfully"
         redirect_to(:action =>'listItems')  
         else
            flash[:notice]="Item     "+@item.name+" cannot be deleted"   
      end
end
  
  def listProducts
     @products=Product.order("products.id DESC")
  end
  def listReviews
     @products=Product.order("products.created_at DESC")
     @reviews = Review.order("reviews.created_at DESC").where(:product_id=>@product.id)
  end
  
  def newReviews
       @review=Review.new(:product_id=>@product.id)
     #@review_count=@product.reviews.count + 1
     #@review_count=@review.index 
  end
  def createReviews
    #Instantiate a new object using for parameters
           @product=Product.find_by_id(params[:product_id])
           @review=Review.new(params[:review])
           @review.update_attributes(:member_username=>session[:username],:product_id=>@product.id)
  #Save the object
         if @review.save    
   #If save succeeds redirect to list 
  # flash[:notice]= "Review for  --"+@review.title+"--added successfully"
          flash[:notice]= "Review added successfully"
          redirect_to(:action=>'listReviews', :product_id => @review.product_id)
  #else redislay the form so user can fix the problem
         else
              flash[:notice]= "Review for "+ @review.title+" cannot be added. "
             render('newReviews')
         end
     end
 
    def editReviews
       #Find the object using form parameters
       @review=Review.find(params[:id])
       @review_count=Review.count
       @products=Product.order('id ASC')
       end

    def updateReviews
         #Find the object using form parameters
         @review=Review.find(params[:id])
         #update with new values
         @review.update_attributes(params[:review])
         #Save the object
          if @review.save
                #If update succeeds redirect to list 
           flash[:notice]= "Review for --"+@review.title+"--updated successfully"
              redirect_to(:action=>'listReviews',:id=>@review.id,:product_id=>@product.id)
         else
           #if save fails ,rediplay the form so user can fix problems
           flash[:notice]= "Review for "+ @review.title+" cannot be updated. "
            @review_count=Review.count
            @products=Product.order('id ASC')
            render('editReviews')
         end
 end
   def deleteReviews
    #Find the object using form parameters
    @review=Review.find(params[:id])
    end
  def destroyReviews
       #Find the object using form parameters
       @review=Review.find(params[:id])
        if @review.destroy
          flash[:notice]="Review for   "+@review.title+" deleted successfully"
           redirect_to(:action =>'listReviews',:product_id=>@product.id)  
           else
              flash[:notice]="Review for    "+@review.title+" cannot be deleted"   
        end
  end
  
  

  def events
  end

  def attempt_login
  end

  
  def logout
    #storing session info
         session[:member_id]= nil
         session[:username]=nil
         flash[:notice]=" Successfully logged out"
          redirect_to(:controller=>'public',:action=>'login')
   end
 private 
  def find_product
      if (params[:product_id])
        @product=Product.find_by_id(params[:product_id])
      end
  end
   
end
