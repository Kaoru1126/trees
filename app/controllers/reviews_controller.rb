class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_strain_status

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    if @review.save
      flash[:notice] = "レビューが投稿されました。ありがとうございます。"
      redirect_to product_path(params[:product_id])
    else
      flash[:alert] = "レビューの投稿に失敗しました。スコアを見直して下さい。"
      @review = Review.new(review_params)
      render 'new'
    end
  end



  private

  def review_params
    params.require(:review).permit(:review, :rate, :reviewImage).merge(user_id: current_user.id, product_id: @product.id)
  end


  def set_strain_status
    theStrainsReviews = Review.includes(:user).where("product_id = ?", params[:product_id])
    @theStrainsReviewsCount = theStrainsReviews.count
  end

end
