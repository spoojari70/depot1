module CurrentWishlist

  private
  def set_wishlist
    @wishlist = Wishlist.find(session[:user_id])
  rescue ActiveRecord::RecordNotFound
    @wishlist = Wishlist.create
    session[:user_id] = @wishlist.id
  end

  def check_wishlist_count
    if user.wishlists.count > 20
      oldest_item = user.wishlists.order(created_at: :asc).first
      oldest_item.destroy
    end
  end


end
