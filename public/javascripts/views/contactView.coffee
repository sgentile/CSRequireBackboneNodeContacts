define [
  'jquery', 
  'underscore', 
  'backbone',
  'text!templates/contactView.html',
  'cs!views/editContact'
], ($, _, Backbone, contactViewTemplate, EditContactView) ->
  class ContactView extends Backbone.View
    tagName: 'tr'
    events:
      "click .editContact" : 'editContact'
    
    initialize: ->
      @model.bind('change', @render, @)
      
    render: ->
      $(@el).html(_.template(contactViewTemplate, @model.toJSON()))
      @
    
    editContact: ->
      editContactView = new EditContactView(model:@model)
      editContactView.render()
