define ['jquery', 'underscore','backbone', 'cs!router'], 
($, _, Backbone, Router) ->
  class App
    @initialize: ->
      Router.initialize()    
