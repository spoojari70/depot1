require "test_helper"

class WishlistsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get wishlists_url
    assert_response :success
  end

  test "should show wishlist" do
    get wishlist_url(@wishlist)
    assert_response :success
  end


  test "should destroy product in wishlist" do
    user = user(:one)
    product = product(:one)
    controller = WishlistsController.new

    session[:user_id] = user.id
    controller.destroy(user,product)

    assert_equal "Removed from your wishlist.", flash[:notice]
  end

end
