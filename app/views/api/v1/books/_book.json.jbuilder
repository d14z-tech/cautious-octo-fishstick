json.extract! book, :id, :user_id, :name, :author, :read_at, :created_at, :updated_at
json.url api_v1_book_url(book, format: :json)
