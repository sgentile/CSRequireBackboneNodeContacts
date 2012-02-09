define [
  'jquery', 
  'underscore', 
  'backbone', 
  'text!templates/mainView.html'
], ($, _, Backbone, mainViewTemplate) ->
  class MainView extends Backbone.View
    el: "#container"
    render: ->
      $(@el).append(mainViewTemplate)
      @
  new MainView()