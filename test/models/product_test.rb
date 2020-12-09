require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "Invalid Product" do
    new_product = Product.new
    assert new_product.invalid?
    assert new_product.errors[:title].any?
    assert new_product.errors[:description].any?
    assert new_product.errors[:image_url].any?
    assert new_product.errors[:price].any?
  end

  test "Product price must be positive" do
    new_product = Product.new title: "New Product",
                              description: "Cool New Product",
                              image_url: "MyCoolImage.png"

    new_product.price = -1
    assert new_product.invalid?
    assert new_product.errors[:price].any?

    new_product.price = 0
    assert new_product.invalid?
    assert new_product.errors[:price].any?

    new_product.price = 69.420
    assert new_product.valid?
  end

  test "image uri is parsed correctly" do
    valid = %w( coolpic.png awesomepic.gif nicepic.jpg http://a.b.c/x/y/z/rad.gif)
    invalid = %w( doesntwork.jpf notsupported.txt shouldntwork.gif.test)


  end
end
