require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'should have "has_secure_password" configured' do
    have_secure_password
  end

  test 'should validate presence of email' do
    validate_presence_of :email
  end

  test 'should validate format of email' do
    allow_value('example@example.com').for :email
  end

  test 'should validate uniqueness of email' do
    validate_uniqueness_of :email
  end

  test 'should validate presence of password_confirmation' do
    validate_presence_of :password_confirmation
  end
end
