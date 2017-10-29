module ApplicationHelper

  def haveIFavedProduct?(product_id)
    if Favproduct.where(user_id: current_user.id, product_id: @product.id).exists?
      return true
    else
      return false
    end
  end

end
