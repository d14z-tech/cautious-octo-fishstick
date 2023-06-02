json.status 'success'
json.data do
  json.user do
    json.partial! 'api/v1/books/book', book: @book
  end
end
