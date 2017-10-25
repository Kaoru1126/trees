class ProductsController < ApplicationController

  def index
    @allStrains = Product.all.order("productName ASC").page(params[:page]).per(20)
  end

  def top
    @test = Product.find(1)
  end

  def show
    #プロダクト表示用
    @product = Product.find(params[:id])
    @products = Product.all

    #レビュー表示用

    ##個別ストレイの直近３レビューを出す
    theStrainsReviews = Review.includes(:user).where("product_id = ?", params[:id])
    @theStrainsReviews = theStrainsReviews.order("created_at DESC").limit(1)


    @findingStrain = Product.find(params[:id])
    @thereview = Review.find_by(params[:id])
    @recentReviews = Review.includes(:user).order("created_at DESC").limit(3)
    binding.pry

  end

  def search
    strains = Product.where('productName LIKE(?)', "%#{params[:keyword]}%")
    @numberOfStrains = strains.count
    @allStrains = strains.order("productName ASC").page(params[:page]).per(20)
  end


end
