require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should create user" do
    assert_difference("User.count") do
      post api_v1_sign_up_url, params: { user: { email: 'example@example.com', password: 'example', password_confirmation: 'example' } }, as: :json
    end

    assert_response :created
    assert response.has_header?('Token')
    assert_not_nil response.get_header('Token')
  end
end
