class FavproductsController < ApplicationController

  def create
    @favpro = Favproduct.new(user_id:favproduct_params[:user_id], product_id:favproduct_params[:product_id])
    @favpro.save
     respond_to do |format|
       format.json
       format.html { redirect_to controller: 'products', action: 'show', id: params[:product_id] }
    end
  end

  def destroy
    favpro = Favproduct.find(params[:id])
    if favpro.destroy
      redirect_to product_path(favpro.product_id)
    end
  end

  def index
    @user = User.find(params[:user_id])
    userFavproducts = Favproduct.includes(:product).where("user_id = ?", params[:user_id])
    @userFavproducts = userFavproducts.order("created_at DESC").page(params[:page]).per(10)
  end


  private

  def favproduct_params
    params.permit(:user_id, :product_id)
  end

end
