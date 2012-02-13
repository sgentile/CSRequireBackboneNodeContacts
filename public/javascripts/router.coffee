define [
  'underscore', 
  'backbone', 
  'cs!views/mainView',
  'cs!views/contactsListView',
  'cs!views/addContact'
], (_, Backbone, mainView, contactsListView, addContact) ->
  class AppRouter extends Backbone.Router
    routes:
      "" : "home"     
           
    home: ->
      mainView.render()
      addContact.render()
      contactsListView.render()
      
    @initialize: (options)->
      app_router = new AppRouter()
      Backbone.history.start()      