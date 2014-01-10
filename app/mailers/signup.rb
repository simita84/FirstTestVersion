class Signup < ActionMailer::Base
default :from => "momsntotsbayarea@gmail.com"  
  
  def registration_email(member) 
    @member = member
    mail( :to => @member.username, :reply_to => 'momsntotsbayarea@gmail.com', :subject => "Welcome to momsntots")
  end
end
