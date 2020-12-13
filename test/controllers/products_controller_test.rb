require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
    @random_title = "The Great Ruby Book Version #{rand(1000)}"
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @random_title } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @random_title } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end

  test "Show, Edit, Destroy links for products should be present" do
    get products_path
    assert_template 'products/index'
    products = assigns(:products)
    products.each do |product|
      assert_select 'a[href=?]', product_path(product), text: 'Show'
      assert_select 'a[href=?]', edit_product_path(product), text: 'Edit'
      assert_select 'a[href=?]', product_path(product), text: 'Destroy'
    end
  end
end
