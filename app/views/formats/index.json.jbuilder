json.array!(@formats) do |format|
  json.extract! format, :id, :extension
  json.url format_url(format, format: :json)
end
