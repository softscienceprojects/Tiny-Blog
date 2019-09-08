require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get admin_dashboard_url
    assert_response :success
  end

  test "should get stats" do
    get admin_stats_url
    assert_response :success
  end

  test "should get settings" do
    get admin_settings_url
    assert_response :success
  end

end
