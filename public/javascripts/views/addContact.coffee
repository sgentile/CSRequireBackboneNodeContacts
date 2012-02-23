define [
  'jquery', 
  'underscore', 
  'backbone',
  'cs!collections/contacts',
  'cs!models/contact',
  'text!templates/addContactView.html',
  'modelbinding'
  'jqueryvalidate'
], ($, _, Backbone, contacts, Contact, addContactViewTemplate, modelbinding) ->
   class AddContact extends Backbone.View
     el: "#addContactRegion"
     model: new Contact
     events: {
      'submit #addContactForm' : 'addContact'
     }
     render: ->
       $(@el).html(addContactViewTemplate)  
       modelbinding.bind(@)  #make sure if you ever close this view to unbind this...
       @
              
     addContact: (e) ->
       e.preventDefault() #don't return for a form post 
       newContact = @model.clone()
       contacts.create(newContact, {
         success: (model, response) =>
           @model.clear()
           $("#firstname").focus()
           @
         error: ->
           alert('error')
           @
       }) if $("#addContactForm").valid()
       
   new AddContact()
      
