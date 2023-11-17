class WishlistsController < ApplicationController

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
      user.products.delete(product)
      respond_to do |format|
        format.html { redirect_to store_index_url, notice: "Removed from your wishlist." }
        format.json { render json: { message: "Product removed from wishlist" } }
      end
    else
      if user.wishlists.count > 20
        oldest_item = user.wishlists.order(created_at: :asc).first
        oldest_item.destroy
      end

      user.products << product
      respond_to do |format|
        format.html { redirect_to store_index_url, notice: "Added to your wishlist." }
        format.json { render json: { message: "Product added to wishlist" } }
      end
    end
  end
end
