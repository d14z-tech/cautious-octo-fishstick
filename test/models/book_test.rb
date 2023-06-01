require "test_helper"

class BookTest < ActiveSupport::TestCase
  test 'should validate presence of name' do
    validate_presence_of :name
  end

  test 'should validate uniqueness of name' do
    validate_uniqueness_of :name
  end
end
