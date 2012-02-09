define [
  'underscore', 
  'backbone', 
  'cs!views/mainView',
  'cs!views/contactsListView'
], (_, Backbone, mainView, contactsListView) ->
  class AppRouter extends Backbone.Router
    routes:
      "" : "home"
      
    home: ->
      mainView.render()
      contactsListView.render()
      
  
    @initialize: (options)->
      app_router = new AppRouter()
      Backbone.history.start()      