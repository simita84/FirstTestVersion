class ProductsController < ApplicationController
  layout 'admin'
  
    before_filter :confirm_logged_in,:except => [:login,:attempt_login]
  def index
    list
    render('list')
  end

  def list
    
   # @products=Product.all
   @products=Product.order("products.id DESC")
   @products=Product.paginate(page: params[:page],per_page: 10) 
  end
  
  def new
     
    @product=Product.new()
  end
  
  def create
    #Instantiate a new object using for parameters
      @product=Product.new(params[:product])
    #Save the object
      if @product.save
    #If save succeeds redirect to list 
    flash[:notice]= "Product --"+@product.title+"--added successfully"
      redirect_to(:action=>'list')
    #else redislay the form so user can fix the problem
      else
        flash[:notice]= "Product"+ @product.title+" cannot be added. "
          render('new')
      end
  end
  def edit
    #Find the object using form parameters
    @product=Product.find(params[:id])
    end

 def update
      #Find the object using form parameters
      @product=Product.find(params[:id])
      #update with new values
      @product.update_attributes(params[:product])
      #Save the object
      if @product.save
        #If update succeeds redirect to list 
        flash[:notice]= "Product --"+@product.title+"--updated successfully"
        redirect_to(:action=>'list')
      else
         flash[:notice]= "Product"+ @product.title+" cannot be updated. "
        render('new')
      end
      end
  
      def delete
        #Find the object using form parameters
        @product=Product.find(params[:id])
        end
      def destroy
           #Find the object using form parameters
           @product=Product.find(params[:id])
            if @product.destroy
              flash[:notice]="Product   "+@product.title+" deleted successfully"
               redirect_to(:action =>'list')  
               else
                  flash[:notice]="Product   "+@product.title+" cannot be deleted"   
            end
      end
  
  
  
end
