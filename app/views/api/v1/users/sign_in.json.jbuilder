json.status 'success'
json.data do
  json.user do
    json.extract! @user, :name, :email
  end
end