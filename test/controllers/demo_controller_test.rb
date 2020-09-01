require 'test_helper'

class DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get exit" do
    get demo_exit_url
    assert_response :success
  end

end
