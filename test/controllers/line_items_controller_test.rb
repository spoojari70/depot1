test "should create line_item" do
  assert_difference('LineItem.count') do
    post line_items_url, params: { product_id: products(:ruby).id }
  end
  follow_redirect!
  assert_select 'h2', 'Your Cart'
  assert_select 'td', 'Programming Ruby 1.9'
end

test "should update line_item" do
  path line_item_url(@line_item),
  params: {line_item: { product_id: @line_item.product_id } }
  assert_redirected_to line_item_url(@line_item)
end
