App.TasksRoute = Ember.Route.extend
  model: ->
    App.Task.find()
