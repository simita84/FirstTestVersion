class AdminsController < ApplicationController
  layout 'admin'
  
      def index
        list
        render('list')
      end

       #List all the admin users
      def list

       @admins=Admin.order("admins.created_at DESC").paginate(:page => params[:page],:per_page =>10)
      end

       #Create new    admin users
      def new

        @admin=Admin.new
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
            flash[:notice]= "Admin "+ @admin.username+" cannot be added. "
              render('new')
          end
      end
      
      
      
      def edit
         #Find the object using form parameters
         @admin=Admin.find(params[:id])
         end

      def update
           #Find the object using form parameters
           @admin=Admin.find(params[:id])
           #update with new values
           @admin.update_attributes(params[:admin])
           #Save the object
           if @admin.save
             #If update succeeds redirect to list 
             flash[:notice]= "Admin details for --"+@admin.last_name+"--updated successfully"
             redirect_to(:action=>'list')
           else
              flash[:notice]= "Admin details for"+ @admin.last_name+" cannot be updated. "
             render('new')
           end
           end

           def delete
             #Find the object using form parameters
             @admin=Admin.find(params[:id])
             end
           def destroy
                #Find the object using form parameters
                @admin=Admin.find(params[:id])
                 if @admin.destroy
                   flash[:notice]="Admin   "+@admin.first_name+" deleted successfully"
                    redirect_to(:action =>'list')  
                    else
                       flash[:notice]="Admin   "+@admin.first_name+" cannot be deleted"   
                 end
           end


      def listMembers
        @members=Member.order("members.created_at DESC").paginate(:page => params[:page],:per_page =>3)
        
      end
        
      def newMember
        @member=Member.new
      end
      
    

      def createMember
        @member=Member.new(params[:member]) 
        
        #Save the object
          if @member.save
        #If save succeeds redirect to list 
        flash[:notice]= "Member --"+@member.username+"--created successfully"
          redirect_to(:action=>'listMembers')
        #else redislay the form so user can fix the problem
          else
            flash[:notice]= "Member "+ @member.username+" cannot be added. "
              render('newMember')
          end
      end
      
       def editMember
           #Find the object using form parameters
           @member=Member.find(params[:id])
           end

        def updateMember
             #Find the object using form parameters
             @member=Member.find(params[:id])
             #update with new values
             @member.update_attributes(params[:member])
             #Save the object
             if @member.save
               #If update succeeds redirect to list 
               flash[:notice]= "Member details for --"+@member.last_name+"--updated successfully"
               redirect_to(:action=>'listMembers')
             else
                flash[:notice]= "Member details for"+ @member.last_name+" cannot be updated. "
               render('newMember')
             end
             end
      
      
      
              def deleteMember
                #Find the object using form parameters
                @member=Member.find(params[:id])
                end
              def destroyMember
                   #Find the object using form parameters
                   @member=Member.find(params[:id])
                    if @member.destroy
                      flash[:notice]="Member   "+@member.first_name+" deleted successfully"
                       redirect_to(:action =>'list')  
                       else
                          flash[:notice]="Member   "+@member.first_name+" cannot be deleted"   
                    end
              end
      
      
      
      
      
      
      
      
      


  
  
end
