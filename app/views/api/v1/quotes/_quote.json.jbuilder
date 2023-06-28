json.extract! quote, :id, :book_id, :content, :created_at, :updated_at
json.url api_v1_book_quote_url(@book, quote, format: :json)
