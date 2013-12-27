class PublicController < ApplicationController
   layout 'public'
 
   before_filter :find_product
    
  def index
  
  @homes=Home.all
  end
   
   
   def login
     render('login')
     
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
             redirect_to(:controller=>"member",:action=>'index')


          else
            flash[:notice]="Not able to  log in,please try again"
              redirect_to(:controller=>'public',:action=>'login')
          end      
      end
  
  def listProducts
      @products=Product.order("products.created_at DESC")

  end
  
  def listReviews
         @products=Product.order("products.created_at ASC")
       @reviews = Review.order("reviews.created_at DESC").where(:product_id=>@product.id) 

   end
   
    def listRecipes
     @recipes=Recipe.order("recipes.created_at DESC")
      end

    
   
   def listItems
     @items=Item.order("items.created_at DESC")
   end
  
  def listContacts
     @contacts=Contact.all
    end
    
   
    
    def SignUp
    end
  
   private 

   def find_product
     if (params[:product_id])
       @product=Product.find_by_id(params[:product_id])
   end
   end
   
    

    

end
