class ReviewsController < ApplicationController
  layout 'admin'
    before_filter :confirm_logged_in,:except => [:login,:attempt_login]
  before_filter :find_product
  
  def index
    
    list
    render('list')
  end

  def list
  @reviews = Review.order("reviews.id DESC").where(:product_id=>@product.id) 
   @reviews=Review.paginate(page: params[:page],per_page: 10) 
   	
   
  end
  
  
  def newReviews
       @review=Review.new(:product_id=>@product.id)
      
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
          redirect_to(:action=>'list', :product_id => @review.product_id)
  #else redislay the form so user can fix the problem
         else
              flash[:notice]= "Review for "+ @review.title+" cannot be added. "
             render('newReviews')
         end
     end
  
  
 
  
  def edit
    #Find the object using form parameters
    @review=Review.find(params[:id])
    @review_count=Review.count
    @products=Product.order('id DESC')
    end

 def update
      #Find the object using form parameters
      @review=Review.find(params[:id])
      #update with new values
      @review.update_attributes(params[:review])
      #Save the object
      if @review.save
        #If update succeeds redirect to list 
        flash[:notice]= "Review for --"+@review.title+"--updated successfully"
        redirect_to(:action=>'list',:id=>@review.id,:product_id=>@product.id)
      else
        #if save fails ,rediplay the form so user can fix problems
        flash[:notice]= "Review for "+ @review.title+" cannot be updated. "
        @review_count=Review.count
        @products=Product.order('id ASC')
        render('edit')
      end
  end
        def delete
          #Find the object using form parameters
          @review=Review.find(params[:id])
          end
        def destroy
             #Find the object using form parameters
             @review=Review.find(params[:id])
              if @review.destroy
                flash[:notice]="Review for   "+@review.title+" deleted successfully"
                 redirect_to(:action =>'list',:product_id=>@product.id)  
                 else
                    flash[:notice]="Review for    "+@review.title+" cannot be deleted"   
              end
        end

  private 
  
  def find_product
    if (params[:product_id])
      @product=Product.find_by_id(params[:product_id])
  end
end

end
