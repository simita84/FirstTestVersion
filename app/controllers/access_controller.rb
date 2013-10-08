class AccessController < ApplicationController
  layout 'admin'
  
    before_filter :confirm_logged_in,:except => [:login,:attempt_login]
  
  
  def index
    render('login')
  end
  
  def login
    
  end
  def attempt_login
    auth_user=AdminUser.authorize(params[:username],params[:password])
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
  
  
end
