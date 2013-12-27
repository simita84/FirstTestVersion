class AccessController < ApplicationController
  layout 'admin'
  
    before_filter :confirm_logged_in,:except => [:login,:attempt_login]
  
  
  def index
    render('login')
  end
  
  def login
    
  end
  def attempt_login
    auth_user=Admin.authorize(params[:username],params[:password])
      if auth_user 
        #storing session info
          session[:user_id]=auth_user.id
          session[:username]=auth_user.username
        
        #Giving mesage of succesful login
          flash[:notice]="You re logged in to Clubby kids"
        
        #directing to authorized pages
          redirect_to(:controller=>'access',:action=>'menu')
      else
        flash[:notice]="Not able to  log in,please try again"
          redirect_to(:controller=>'access',:action=>'login')
      end      
  end
  
  def logout
    
     #storing session info
        session[:user_id]= nil
        session[:username]=nil
        flash[:notice]=" Successfully logged out"
         redirect_to(:controller=>'access',:action=>'login')
  end
   #List all the member users
   def listMembers

    @members=Member.order("members.created_at ASC")
   end

    #Create new    admin users
   def new

     @member=Member.new()
   end

   def create
     #Instantiate a new object using for parameters
       @member=Member.new(params[:product])
     #Save the object
       if @member.save
     #If save succeeds redirect to list 
     flash[:notice]= "Member --"+@member.username+"--created successfully"
       redirect_to(:action=>'list')
     #else redislay the form so user can fix the problem
       else
         flash[:notice]= "Member"+ @member.username+" cannot be added. "
           render('new')
       end
   end
  
  
end
