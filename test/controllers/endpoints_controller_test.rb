require "test_helper"

class EndpointsControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get root_url, as: :json
    assert_response :success
  end
end
