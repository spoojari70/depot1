require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "recieved" do
    mail = OrderMailer.recieved(order(:one))
    assert_equal "Your book store Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot1@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "Your book store Order Shipped", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["depot1@example.com"], mail.from
    assert_match /<td[^>]*>1<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded
  end

end
