module ApplicationHelper
  def total_cart_item
    if session[:cart_id].present?
      @cart = Cart.find(session[:cart_id])
      @cart.line_items.sum(:quantity)
    else
      0
    end
  end
end
