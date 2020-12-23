require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    order = orders(:one)
    mail = OrderMailer.received(order)
    assert_equal "Confirmation Email Depot.com", mail.subject
    assert_equal [order.email], mail.to
    assert_equal 'Arthur Ruby <no-reply@depot.com', mail.from
    assert_match "Thank you for your purchase", mail.body.encoded
  end

  test "shipped" do
    order = orders(:one)
    mail = OrderMailer.shipped(order)
    assert_equal "Your order has been shipped, yay!", mail.subject
    assert_equal [order.email], mail.to
    assert_equal 'Arthur Ruby <no-reply@depot.com', mail.from
    assert_match "we've shipped your recent order", mail.body.encoded
  end

end
