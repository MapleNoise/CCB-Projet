json.array!(@sections) do |section|
  json.extract! section, :id, :ref, :nom, :description, :dateSuppression
  json.url section_url(section, format: :json)
end
