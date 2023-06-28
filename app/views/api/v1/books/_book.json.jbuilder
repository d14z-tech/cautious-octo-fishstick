json.extract! book, :id, :user_id, :gender, :title, :author, :cost, :observations, :read_at, :page, :created_at, :updated_at, :quotes
json.url api_v1_book_url(book, format: :json)
