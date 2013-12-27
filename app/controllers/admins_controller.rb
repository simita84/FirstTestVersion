class AdminsController < ApplicationController
  layout 'admin'
  
      def index
        list
        render('list')
      end

       #List all the admin users
      def list

       @admins=Admin.order("admins.created_at ASC")
      end

       #Create new    admin users
      def new

        @admin=Admin.new()
      end

      def create
        @admin=Admin.new(params[:admin]) 
        
        #Save the object
          if @admin.save
        #If save succeeds redirect to list 
        flash[:notice]= "Admin --"+@admin.username+"--created successfully"
          redirect_to(:action=>'list')
        #else redislay the form so user can fix the problem
          else
            flash[:notice]= "Admin"+ @admin.username+" cannot be added. "
              render('new')
          end
      end


  
  
end
