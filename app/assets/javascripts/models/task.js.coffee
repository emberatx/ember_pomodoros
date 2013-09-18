{attr, hasMany} = Ember

App.Task = Ember.Model.extend
  name: attr()
  estimate: attr()
  status: attr()
  pomodoros: hasMany()

App.Task.url = "/api/tasks"
App.Task.adapter = Ember.RESTAdapter.create()
