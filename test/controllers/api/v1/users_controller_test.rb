require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should create user' do
    assert_difference("User.count") do
      post api_v1_sign_up_url, params: { user: { name: 'sample', email: 'sample@sample.com', password: 'sample', password_confirmation: 'sample' } }, as: :json
    end

    assert_response :created
    assert response.has_header?('Token')
    assert_not_nil response.get_header('Token')
  end

  test 'should sign in a user' do
    post api_v1_sign_in_url, params: { user: { email: users(:one).email, password: 'example' } }, as: :json

    assert_response :ok
    assert response.has_header?('Token')
    assert_not_nil response.get_header('Token')
  end
end
