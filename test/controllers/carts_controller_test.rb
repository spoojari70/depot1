test"should destroy cart" do
  post line_items_url, params: { product_id: products(:ruby).id }
  @cart = Cart.find(session[:cart_id])

  assert_difference('Cart.count', -1) do
    delete cart_url(@cart)
  end
  assert_redirected_to store_index_url
end
