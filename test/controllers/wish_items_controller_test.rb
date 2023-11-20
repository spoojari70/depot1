require "test_helper"

class WishItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wish_item = wish_items(:one)
  end

  test "should get index" do
    get wish_items_url
    assert_response :success
  end

  test "should get new" do
    get new_wish_item_url
    assert_response :success
  end

  test "should create wish_item" do
    assert_difference("WishItem.count") do
      post wish_items_url, params: { product_id: products(:ruby).id }
    end
    follow_redirect!

    assert_select 'h2', 'Your Pragmatic Cart'
    assert_select 'li', 'Programming Ruby 1.9'
  end

  test "should show wish_item" do
    get wish_item_url(@wish_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_wish_item_url(@wish_item)
    assert_response :success
  end

  test "should update wish_item" do
    patch wish_item_url(@wish_item), params: { wish_item: { product_id: @wish_item.product_id } }
    assert_redirected_to wish_item_url(@wish_item)
  end

  test "should destroy wish_item" do
    assert_difference("WishItem.count", -1) do
      delete wish_item_url(@wish_item)
    end

    assert_redirected_to wish_items_url
  end
end
