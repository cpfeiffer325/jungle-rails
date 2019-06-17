class ReviewsController < ApplicationController
  before_filter :current_user, :only => [:create, :destroy]

  def new
    @review = Review.new
  end

  def create
    @product= Product.find_by_id(params[:product_id])
    # @review= @product.reviews.new(review_params)
    @review= Review.new(review_params)
    @review.product_id = @product.id
    @review.rating = @review.rating.to_i
    @review.user_id = current_user.id
    puts "this is the review: #{@review.inspect}"

    if @review.save
      redirect_to product_path(@product)
    else
      redirect_to "/"
    end
  end

  def destroy
    # ensure user only can find owner comment.
    @review = Review.find(params[:id])
    @product = Product.find(@review.product_id)
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end
