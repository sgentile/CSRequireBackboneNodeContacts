define [
  'jquery', 
  'underscore', 
  'backbone',
  'cs!models/contact'
  'cs!collections/contacts',
  'text!templates/editContactView.html',
  'modelbinding'
  'jqueryvalidate'
], ($, _, Backbone, Contact, contacts, editContactTemplate, modelbinding) ->
  class EditContact extends Backbone.View
    el: "#editContactRegion"
    events:
      "submit #editContactForm" : 'saveContact'
    
    initialize: ->
      @model.bind('destroy', @remove, @)
      
    render: ->      
      $(@el).html(_.template(editContactTemplate, @model.toJSON()))
      modelbinding.bind(@)
      @
            
    remove: ->
      $(@el).unbind();
      $('#editContactContainer').remove();
      
      
    saveContact: (e) ->
      e.preventDefault()
      
      alert(@model.get('firstname'))
      
      @model.save        
        firstname: $("#editfirstname").val()
        lastname: $("#editlastname").val()
      ,  
        success: (model, response) =>
          $(@el).unbind();
          $(@el).empty();
          modelbinding.unbind(@)
          model.collection
      ,
        error: (model, response) ->
          alert('error')
      
     
      
