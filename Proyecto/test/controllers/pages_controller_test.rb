require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get pages_dashboard_url
    assert_response :success
  end

  test "should get 404" do
    get pages_404_url
    assert_response :success
  end

end
