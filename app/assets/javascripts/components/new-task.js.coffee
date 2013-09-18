App.NewTaskComponent = Ember.Component.extend
  createTask: ->
    model = App.Task.create
      name: @get('name')
      status: "not_started"
    model.save()
    @set('name', "")
