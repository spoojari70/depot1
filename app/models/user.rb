class User < ApplicationRecord
  has_many :wishlists
  has_many :wishlist_products, through: :wishlists, source: :product

  validates :name, presence: true, uniqueness: true
  has_secure_password
  after_destroy :ensure_an_admin_remains


  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise Error.new "Can't delete last user"
      end
    end
end
