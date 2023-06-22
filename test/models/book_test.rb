require "test_helper"

class BookTest < ActiveSupport::TestCase
  test 'should validate presence of title' do
    validate_presence_of :title
  end

  test 'should validate uniqueness of title' do
    validate_uniqueness_of :title
  end
end
