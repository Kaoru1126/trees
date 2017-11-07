# class StrainsController < ApplicationController


#   def index
#     @allStrains = Product.all.order("productName ASC").page(params[:page]).per(20)
#   end

#   def top
#     @test = Product.find(1)
#   end

#   def show
#     @product = Product.find(params[:id])
#     @products = Product.all
#   end

#   def search
#     strains = Product.where('productName LIKE(?)', "%#{params[:keyword]}%")

#     @numberOfStrains = strains.count
#     @allStrains = strains.order("productName ASC").page(params[:page]).per(20)
#   end


# end
