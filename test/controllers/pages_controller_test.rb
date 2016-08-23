require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pages_home_url
    assert_response :success
  end

  test "should get sign_in" do
    get pages_sign_in_url
    assert_response :success
  end

  test "should get cart" do
    get pages_cart_url
    assert_response :success
  end

end
