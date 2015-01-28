json.array!(@reponses) do |reponse|
  json.extract! reponse, :id, :reponse, :estJuste, :dateSuppression
  json.url reponse_url(reponse, format: :json)
end
