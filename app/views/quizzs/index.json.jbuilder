json.array!(@quizzs) do |quizz|
  json.extract! quizz, :id, :ref, :nom, :description, :dateSuppression
  json.url quizz_url(quizz, format: :json)
end
