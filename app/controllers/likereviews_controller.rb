class LikereviewsController < ApplicationController

  def create
    @likeReview = Likereview.new(user_id:likereview_params[:user_id], review_id:likereview_params[:review_id])
    @likeReview.save
     respond_to do |format|
       format.json
       format.html { redirect_to controller: 'products', action: 'show', id: params[:product_id] }
    end
  end

  def destroy
    likeReview = Likereview.find(params[:id])
    if likeReview.destroy
      redirect_to product_path(likeReview.review.product_id)
    end
  end

  def index
    @user = User.find(params[:user_id])
    userLikeReviews = Likereview.includes(:user, :review).where("user_id = ?", params[:user_id])
    @userLikeReviews = userLikeReviews.order("created_at DESC").page(params[:page]).per(10)
  end


  private

  def likereview_params
    params.permit(:user_id, :review_id)
  end

end

