module ApplicationHelper

  def haveIFavedProduct?(product_id)
    if Favproduct.where(user_id: current_user.id, product_id: @product.id).exists?
      return true
    else
      return false
    end
  end

  def haveIWatchedProduct?(product_id)
    if Watchproduct.where(user_id: current_user.id, product_id: @product.id).exists?
      return true
    else
      return false
    end
  end

  def haveILikedReview?(review_id)
    if user_signed_in?
      if Likereview.where(user_id: current_user.id, review_id: review_id).exists?
        return true
      else
        return false
      end
    end
  end

  def haveILikedReviewIndex?(review_id)
    if Likereview.where(user_id: current_user.id, review_id: userLikeReview.review.id).exists?
      return true
    else
      return false
    end
  end

  # topのビュー
  def haveIFavedProductTop?(product_id)
    if Favproduct.where(user_id: current_user.id, product_id: @productHavingMostReview.id).exists?
      return true
    else
      return false
    end
  end

  def haveIWatchedProductTop?(product_id)
    if Watchproduct.where(user_id: current_user.id, product_id: @productHavingMostReview.id).exists?
      return true
    else
      return false
    end
  end

end
