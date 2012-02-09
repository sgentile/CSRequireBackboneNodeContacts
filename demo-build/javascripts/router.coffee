define [
  'underscore', 
  'backbone', 
  'cs!views/mainView'
], (_, Backbone, mainView) ->
  class AppRouter extends Backbone.Router
    routes:
      "*actions" : "home",
      "contacts" : "home"
      
    home: ->
      mainView.render()
  
    @initialize: (options)->
      app_router = new AppRouter()
      Backbone.history.start()      