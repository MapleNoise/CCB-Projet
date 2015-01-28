json.array!(@extension_fichiers) do |extension_fichier|
  json.extract! extension_fichier, :id, :extension
  json.url extension_fichier_url(extension_fichier, format: :json)
end
