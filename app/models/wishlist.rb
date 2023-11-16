class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :product

  after_create :check_wishlist_count

  private

  def check_wishlist_count
    if user.wishlists.count > 20
      oldest_item = user.wishlists.order(created_at: :asc).first
      oldest_item.destroy
    end
  end
end
