module CurrentWishlist

  private

    def set_wishlist
      @wishlist = Wishlist.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      @wishlist = Wishlist.create
      session[:user_id] = @wishlist.id
    end

end
