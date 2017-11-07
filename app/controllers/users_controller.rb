class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    # @userReviews = Review.where("user_id = ?", params[:id]) いらない？
    @userReviews = Review.includes(:product).where("user_id = ?", params[:id])
    @recnetUserReviews = @userReviews.order("created_at DESC").limit(3)

    #トータルGoodを出す
    userAllReviewsLikes = 0
    userAllReviews = @user.reviews
      userAllReviews.each do |review|
        eachReviewLikes = review.likereviews_counts

        userAllReviewsLikes += eachReviewLikes
      end
    @userAllReviewsLikes = userAllReviewsLikes

    # レビュー辺り平均good数
    goodPerReview = userAllReviewsLikes / userAllReviews.count.to_f
    @goodPerReview = goodPerReview.round(2)
    #そのユーザーの最も評価の高いレビュー
    @theMostRatedReview = @userReviews.order("likereviews_counts DESC").limit(1)

    #そのユーザーがlikeしたレビューの数
    @userLikereviews = Likereview.where("user_id = ?", params[:id])
    @userLikereviewsCounts = @userLikereviews.count
  end
end

