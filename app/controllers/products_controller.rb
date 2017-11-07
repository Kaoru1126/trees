class ProductsController < ApplicationController

  def top
    # 総合(総合レートが一番高い)
    # productsHavingReviews = Product.where('review_counts > 0')
    #   box = []
    #   productsHavingReviews.each do |product|
    #     productIDs = product.id
    #     selectedPro = Review.where("product_id = #{product.id}").order("product_id ASC")

    #     rate = 0
    #     proName = "unknow"
    #     numOfReviews = 0
    #     selectedPro.each do |adding|
    #       rate += adding.rate
    #       proName = adding.product.productName
    #     end
    #     proName2 = proName
    #     productAllScore = rate / selectedPro.length.to_f
    #     numOfReviews = selectedPro.length
    #     nameAndScoreSet = {productName: proName2,rate:productAllScore, numOfReviews:numOfReviews}
    #     box << nameAndScoreSet
        # end

    # 最もレビューの多いストレイン出す
    productHavingReviews = Product.all.where("review_counts > 0")
    @productHavingMostReview = productHavingReviews.order("review_counts DESC").first
    @productHavingMostReviews = @productHavingMostReview.reviews
    tempRate = 0
    @productHavingMostReviews.each do |avrRate|
      tempRate += avrRate.rate
    end
    proHavingRevAvrScore = tempRate / @productHavingMostReviews.length.to_f
    @proHavingRevAvrScore = proHavingRevAvrScore.round(1)

    #直近3つだす
    @recentThreeRevs = Review.includes(:product, :user).all.order("created_at DESC").limit(3)
    # 評価の高いレビュー
    @mostVotedRevs = Review.all.order("likereviews_counts DESC").limit(1)
  end

  def index
    @allStrains = Product.all.order("productName ASC").page(params[:page]).per(20)
  end


  def show
    #プロダクト表示用
    @product = Product.find(params[:id])
    @products = Product.all

    #レビュー表示用

    ##個別ストレインの直近レビューを出す
    theStrainsReviews = Review.where("product_id = ?", params[:id])
    @theStrainsReviewsCount = theStrainsReviews.count
    @theStrainsReviews = theStrainsReviews.includes(:user, :product).order("created_at DESC").limit(3)

    @findingStrain = Product.find(params[:id])
    @thereview = Review.find_by(params[:id])
    @recentReviews = Review.includes(:user, :product).order("created_at DESC").limit(3)

    # 個別ストレインの平均値を出す
    tempRate = 0
    theStrainsReviews.each do |review|
      tempRate += review.rate
    end
      productScore = tempRate / theStrainsReviews.length.to_f
      @productScore = productScore.round(1)

    # 最も評価の高いレビューを出す
      @theMostRatedReview = theStrainsReviews.order("likereviews_counts DESC").limit(1)
  end

  def search
    strains = Product.where('productName LIKE(?)', "%#{params[:keyword]}%")
    @numberOfStrains = strains.count
    @allStrains = strains.order("productName ASC").page(params[:page]).per(20)
  end


end
