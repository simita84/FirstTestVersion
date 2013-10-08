class ApplicationController < ActionController::Base
  protect_from_forgery
  
  #Confirming the user is logged in or authorized to view the pages
 
 #protected so that sub classes can access them

  protected
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice]="Please login"
      redirect_to(:controller=>'access',:action=>'login')
      return false #halts the before_filter  
    else
      return true
    end
  end
  
  #protected so that sub classes can access them
    protected
    def confirm_member_logged_in
      unless session[:member_id]
        flash[:notice]="Please login"
        redirect_to(:controller=>'public',:action=>'login')
        return false #halts the before_filter  
      else
        return true
      end
    end
  
  
end
