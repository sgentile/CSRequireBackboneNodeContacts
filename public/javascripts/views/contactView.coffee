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
      "click .removeContact" : "removeContact"
    
    initialize: ->
      @model.bind('change', @render, @)
      @model.bind('destroy', @remove, @)
      
    render: ->
      $(@el).html(_.template(contactViewTemplate, @model.toJSON()))
      @
    
    remove: ->
      $(@el).unbind();
      $(@el).remove();
      
    removeContact: ->
      @model.destroy()
    
    editContact: ->
      editContactView = new EditContactView(model:@model)
      editContactView.render()
