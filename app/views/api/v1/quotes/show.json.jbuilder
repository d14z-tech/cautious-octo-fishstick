json.status 'success'
json.data do
  json.quote do
    json.partial! "api/v1/quotes/quote", quote: @quote
  end
end
