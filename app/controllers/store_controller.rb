class StoreController < ApplicationController
  # before_action :authorize_admin
  skip_before_action :authorize
  include CurrentCart
  before_action :set_cart

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      if params[:search]
        @products = Product.where("title LIKE ?", "%#{params[:search]}%").page(params[:page]).per(3)
        if @products.empty?
          flash.now[:notice] = "Products Unavailable."
        end
      else
        @products = Product.page(params[:page]).per(5)
      end
    end
  end

end
