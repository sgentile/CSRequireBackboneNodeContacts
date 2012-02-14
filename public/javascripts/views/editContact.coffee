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
    
    initialize: ->
      @model.bind('destroy', @remove, @)
      
    render: ->      
      $(@el).html(_.template(editContactTemplate, @model.toJSON()))
      $("#editContactForm").validate({
        errorClass:'error'
        validClass:'success'
        errorElement:'span'      
        highlight: (element, errorClass, validClass) ->
          $(element).parent('div').parent('div').removeClass(validClass).addClass(errorClass)
        unhighlight: (element, errorClass, validClass) ->
          $(element).parent('div').parent('div').removeClass(errorClass).addClass(validClass)
      })
      
    remove: ->
      $(@el).unbind();
      $('#editContactContainer').remove();
      
      
    saveContact: (e) ->
      e.preventDefault()
      
      
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
      
     
      
