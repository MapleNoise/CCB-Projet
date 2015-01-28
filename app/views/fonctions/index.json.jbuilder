json.array!(@fonctions) do |fonction|
  json.extract! fonction, :id, :nom
  json.url fonction_url(fonction, format: :json)
end
