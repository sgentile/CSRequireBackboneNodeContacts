define [
  'jquery', 
  'underscore', 
  'backbone',
  'cs!models/contact'
  'cs!collections/contacts',
  'text!templates/editContactView.html'
  'jqueryvalidate'
], ($, _, Backbone, Contact, contacts, editContactTemplate) ->
  class EditContact extends Backbone.View
    el: "#editContactRegion"
    events:
      "submit #editContactForm" : 'saveContact'
    
    render: ->      
      $(@el).html(_.template(editContactTemplate, @model.toJSON()))
      @
      
    saveContact: (e) ->
      e.preventDefault()
      $("#editContactForm").validate()
      
      
      @model.save        
        firstname: $("#editfirstname").val()
        lastname: $("#editlastname").val()
      ,  
        success: (model, response) =>
          $(@el).unbind();
          $(@el).empty();
          model.collection
      ,
        error: (model, response) ->
          alert('error')
      
     
      
