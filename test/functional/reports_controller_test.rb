require 'test_helper'

class ReportsControllerTest < ActionController::TestCase
  test "should get current_month" do
    get :current_month
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
