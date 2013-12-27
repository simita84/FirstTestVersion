class MemberController < ApplicationController
 
    layout 'member'
    before_filter :find_product
    before_filter :confirm_member_logged_in
  def index
     render("index")
  end

  def showAccountInfo
     @user=Member.where(:username=>session[:username])
  end
 
   def listRecipes
     # @recipes=Recipe.order("recipes.created_at DESC")
       #@recipes=Recipe.order("recipes.created_at ASC")
       @recipes = Recipe.all
   end
   
   
   def newRecipes
        @recipe=Review.new
     
   end
  
   def createRecipes
     @recipe=Recipe.new(params[:recipe]) 
     
     #Save the object
       if @recipe.save
     #If save succeeds redirect to list 
     flash[:notice]= "Recipe --"+@recipe.title+"--created successfully"
       redirect_to(:action=>'listRecipes')
     #else redislay the form so user can fix the problem
       else
         flash[:notice]= "Recipe"+ @recipe.username+" cannot be added. "
           render('newRecipes')
       end
   end


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  def listProducts
     @products=Product.order("products.index ASC")
  end

  

  def listReviews
     @products=Product.order("products.created_at ASC")
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
       @products=Product.order('index ASC')
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
            @products=Product.order('index ASC')
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

  def listMembers
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
