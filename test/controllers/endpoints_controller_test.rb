require "test_helper"

class EndpointsControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get root_url, as: :json
    assert_response :success
  end

  test "should get health_check" do
    get health_check_url, as: :json
    assert_response :success
  end
end
