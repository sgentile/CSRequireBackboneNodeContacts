define [
  'jquery', 
  'underscore', 
  'backbone', 
  'text!templates/mainView.html'
], ($, _, Backbone, mainViewTemplate) ->
  class MainView extends Backbone.View
    el: "#mainRegion"
    render: ->
      $(@el).html(mainViewTemplate)
      @
  new MainView()