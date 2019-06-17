class ProductsController < ApplicationController
  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @review = Review.new
    @reviews = Review.where(product_id: @product.id).order(created_at: :desc)
  end
end
