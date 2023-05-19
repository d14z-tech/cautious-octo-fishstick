require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not save user without email" do
    user = User.new(password: '123456')
    assert_not user.save
  end

  test "should not save user with an invalid email" do
    user = User.new(email: "this is a invalid email", password: "123456")
    assert_not user.save
  end

  test "should not save user without password" do
    user = User.new(email: "myemail@mydomain.com")
    assert_not user.save
  end

  test "should not save user when password not match to password_confirmation" do
    user = User.new(email: "myemail@mydomain.com", password: "123456", password_confirmation: "098765")
    assert_not user.save
  end

  test "should not save user when password have more than 72 characters" do
    user = User.new(email: "myemail@mydomain.com", password: SecureRandom.hex(37))
    assert_not user.save
  end
end
