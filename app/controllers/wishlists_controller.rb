class WishlistsController < ApplicationController
  before_action :find_current_user

  def create
    product = Product.find(params[:product_id])

    @wishlist_item = @current_user.build(product: product)

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to product, notice: 'Product added to your wishlist.' }
      else
        format.html { redirect_to product, notice: 'Failed to add product to wishlist.' }
      end
    end
  end

  def destroy
    @wishlist_item = Wishlist.find(params[:id])

    respond_to do |format|
      if @wishlist_item.destroy
        format.html { redirect_to @wishlist_item.product, notice: 'Removed product from wishlist.' }
      else
        format.html { redirect_to @wishlist_item.product, notice: 'Failed to remove product from wishlist.' }
      end
    end
  end

  private

  def find_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

end
