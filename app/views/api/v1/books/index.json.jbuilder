json.status 'success'
json.data do
  json.books do
    json.array! @books, partial: 'api/v1/books/book', as: :book
  end
end
