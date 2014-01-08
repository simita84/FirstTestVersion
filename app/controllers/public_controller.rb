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
      @products=Product.order("products.created_at DESC").paginate(:page => params[:page],:per_page =>50)
 
  end
  
  def listReviews
         @products=Product.order("products.created_at ASC")
         @reviews = Review.order("reviews.created_at DESC").where(:product_id=>@product.id).paginate(:page => params[:page],:per_page =>1) 
      
   end
   
    def listRecipes
   # @recipes=Recipe.order("recipes.created_at DESC").page(params[:recipe])
    # @recipes=Recipe.order("recipes.created_at DESC")
     # @users = User.search(query).page(params[:user_page])
     
     @recipes = Recipe.order("recipes.created_at DESC").paginate(:page => params[:page],:per_page =>3)
      
      end
 
   def listItems
     
      @items = Item.order("items.created_at DESC").paginate(:page => params[:page],:per_page =>3)
   end
  
  def listContacts
     @contacts=Contact.all
    end
    
    #----------------Member Registration--------------------------------------------
    def newMember
        @member = Member.new
      end

      def showMember
       # raise params.inspect
        @member = Member.find_by_id(params[:id])
      end  

      def createMember
        member = Member.new(params[:member])
        if member.save
          
         session[:member_id]=member.id
         session[:username]=member.username
      
         flash[:success] = 'Welcome to Momsntots.'
       
        redirect_to(:controller=>"member",:action=>'index')
          
         # sendemailToMember
      #  Emailer.registration_email(@member).deliver
       else
         render('newMember')
        end

       # Emailer.registration_email(@member).deliver
      end


      def sendemailToMember

        if @member
          Emailer.registration_email(@member).deliver
        end  
      end
    
    
    
    
    
    #-----------------------Member Registration-------------------------------------
    
  
  
  
  
   private 

   def find_product
     if (params[:product_id])
       @product=Product.find_by_id(params[:product_id])
   end
   end
   
    

    

end
