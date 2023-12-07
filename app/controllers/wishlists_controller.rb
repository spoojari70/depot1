class WishlistsController < ApplicationController
  before_action :authenticate_user!


  def show
    user_id = session[:user_id]
    @user = User.find(user_id)
    @wishlist_products = @user.products
  end

  def add_to_wishlist
    user_id = session[:user_id]
    product_id = params[:product_id]

    user = User.find(user_id)
    product = Product.find(product_id)

    if user.products.include?(product)
      destroy(user, product)
    else
      add_product_to_wishlist(user, product)
    end

  end

  def destroy(user, product)
    user.products.delete(product)
    redirect_to store_index_url, notice: "Removed from your wishlist."
  end


  private

  def add_product_to_wishlist(user, product)
    if user.wishlists.count > 20
      oldest_item = user.wishlists.order(created_at: :asc).first
      oldest_item.destroy
    end

    user.products << product
    respond_to do |format|
      format.html { redirect_to store_index_url, notice: "Added to your wishlist." }
    end
  end

end


