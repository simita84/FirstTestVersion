class MembersController < ApplicationController
  layout 'member'
   before_filter :find_product
   before_filter :confirm_member_logged_in
  
  def index
      
  end
  
  def events
 
  end
  
  
  
  
  def login
    
  end
    
  def attempt_login
     member=Member.authorize(params[:username],params[:password])
       if member 
         #storing session info
           session[:member_id]=member.id
           session[:username]=member.username

         #Giving message of succesful login
           flash[:notice]="You re logged in to Clubby kids"

         #directing to authorized pages
          redirect_to(:controller=>"members",:action=>'index')
         
         
       else
         flash[:notice]="Not able to  log in,please try again"
           redirect_to(:controller=>'members',:action=>'login')
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
  end
  
  def updateReviews
    end
    
    def deleteReviews
    end

    def destroyReviews
      end
  
  
  def listRecipes
    
  end
  
  def listItems
    
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
