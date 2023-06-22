require "test_helper"

class Api::V1::BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
    @headers = { 'Authorization' => @book.user.token }
  end

  test "should get index" do
    get api_v1_books_url, headers: @headers, as: :json
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post api_v1_books_url, params: { book: { author: @book.author, title: 'sample', read_at: @book.read_at } }, headers: @headers, as: :json
    end

    assert_response :created
  end

  test "should show book" do
    get api_v1_book_url(@book), headers: @headers, as: :json
    assert_response :success
  end

  test "should update book" do
    patch api_v1_book_url(@book), params: { book: { author: @book.title, name: @book.title, read_at: @book.read_at } }, headers: @headers, as: :json
    assert_response :success
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete api_v1_book_url(@book), headers: @headers, as: :json
    end

    assert_response :no_content
  end
end
