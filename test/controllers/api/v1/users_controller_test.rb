require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @headers = { 'Authorization' => @user.token }
  end

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

  test 'should logout an user' do
    old_token = @user

    delete api_v1_logout_url, headers: @headers, as: :json

    assert_response :no_content
    assert old_token != @user.reload.token
  end
end
