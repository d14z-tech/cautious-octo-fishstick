json.status 'success'
json.data do
  json.book do
    json.partial! 'api/v1/books/book', book: @book
  end
end
