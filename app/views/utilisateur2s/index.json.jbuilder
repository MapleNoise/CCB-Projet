json.array!(@utilisateur2s) do |utilisateur2|
  json.extract! utilisateur2, :id, :name, :email, :password_digest
  json.url utilisateur2_url(utilisateur2, format: :json)
end
