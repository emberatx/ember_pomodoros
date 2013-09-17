json.array!(@pomodoros) do |pomodoro|
  json.extract! pomodoro, :status, :task_id, :started_at, :completed_at
  json.url pomodoro_url(pomodoro, format: :json)
end
