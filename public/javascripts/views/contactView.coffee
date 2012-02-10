define [
  'jquery', 
  'underscore', 
  'backbone',
  'text!templates/contactView.html'
], ($, _, Backbone, contactViewTemplate) ->
  class ContactView extends Backbone.View
    tagName: 'tr'
    #template: 
    render: ->
      $(@el).html(_.template(contactViewTemplate, @model.toJSON()))
      @