json.array!(@submissions) do |submission|
  json.extract! submission, :id, :title, :url, :description, :type
  json.url submission_url(submission, format: :json)
end
