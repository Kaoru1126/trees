class WatchproductsController < ApplicationController

  def create
    @watchpro = Watchproduct.new(user_id:watchproduct_params[:user_id], product_id:watchproduct_params[:product_id])
    @watchpro.save
     respond_to do |format|
       format.json
       format.html { redirect_to controller: 'products', action: 'show', id: params[:product_id] }
    end
  end

  def destroy
    watchpro = Watchproduct.find(params[:id])
    if watchpro.destroy
      redirect_to product_path(watchpro.product_id)
    end
  end

  def index
    @user = User.find(params[:user_id])
    userWatchproducts = Watchproduct.includes(:product).where("user_id = ?", params[:user_id])
    @userWatchproducts = userWatchproducts.order("created_at DESC").page(params[:page]).per(10)
  end


  private

  def watchproduct_params
    params.permit(:user_id, :product_id)
  end

end
