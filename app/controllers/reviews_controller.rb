class ReviewsController < ApplicationController
  layout 'admin'
    before_filter :confirm_logged_in,:except => [:login,:attempt_login]
  before_filter :find_product
  
  def index
    
    list
    render('list')
  end

  def list
  @reviews = Review.order("reviews.index ASC").where(:product_id=>@product.id) 
  #@reviews = Review.where(:product_id=>@product.id) 
  end

  
  
  
  def edit
    #Find the object using form parameters
    @review=Review.find(params[:id])
    @review_count=Review.count
    @products=Product.order('index ASC')
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
        @products=Product.order('index ASC')
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
