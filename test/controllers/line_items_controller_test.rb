require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

  test "should create line_item" do
    current_product = products(:ruby)
    assert_difference 'LineItem.count' do
      post line_items_path, params: { product_id: current_product.id }
    end

    follow_redirect!

    assert_select 'h2', 'Your Cart'
    assert_select 'td', "#{current_product.title}"
  end

  test "should create line item via ajax" do
    current_product = products(:ruby)
    assert_difference 'LineItem.count' do
      post line_items_path, params: { product_id: current_product.id }, xhr: true
    end

    assert_response :success
    assert_match /<tr class=\\"line-item-highlight/, @response.body
  end

  test "should create separate product entries" do
    first_product = products(:one)
    post line_items_path, params: { product_id: first_product.id }

    second_product = products(:two)
    post line_items_path, params: { product_id: second_product.id }

    get cart_path(session[:cart_id])

    assert_select 'td', "#{first_product.title}"
    assert_select 'td', "#{second_product.title}"

  end

  test "should not create separate product entries and instead increase quantity" do
    first_product = products(:one)
    post line_items_path, params: { product_id: first_product.id }

    first_product = products(:one)
    post line_items_path, params: { product_id: first_product.id }

    get cart_path(session[:cart_id])

    assert_select 'td', "#{first_product.title}"
    assert_select 'td.quantity', '2'
  end

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to store_index_url
  end
end
