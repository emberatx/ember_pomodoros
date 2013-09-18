# For more information see: http://emberjs.com/guides/routing/

App.Router.map ->
  @resource 'tasks', path: '/tasks'
  @route "fourOhFoured", path: "*:"

App.Router.reopen
  location: 'history'