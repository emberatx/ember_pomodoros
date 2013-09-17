json.array!(@tasks) do |task|
  json.extract! task, :name, :estimate, :status
  json.url task_url(task, format: :json)
end
