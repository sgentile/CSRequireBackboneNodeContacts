define [
  'jquery', 
  'underscore', 
  'backbone',
  'text!templates/contactView.html'
], ($, _, Backbone, contactViewTemplate) ->
  class ContactView extends Backbone.View
    tagName: 'li'
    #template: 
    render: ->
      #$(@el).html(@template(@model.toJSON()))
      $(@el).html(_.template(contactViewTemplate, @model.toJSON()))
      @