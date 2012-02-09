define [
  'jquery', 
  'underscore', 
  'backbone',
  'cs!collections/contacts'
  'text!templates/addContactView.html'
], ($, _, Backbone, contacts, addContactViewTemplate) ->
  class AddContact extends Backbone.View
    el: "#addContactRegion"
    events: {
      'submit #addContactForm' : 'addContact'
    }
    render: ->
      $(@el).html(addContactViewTemplate)
      
    addContact: (e) ->
      e.preventDefault() #don't return for a form post
      newContact = {
        firstname:  $("#firstname").val(),
        lastname:   $("#lastname").val()
      }
      contacts.create(newContact, {
        success: (model, response) ->
          alert('added')
        error: ->
          alert('error')
      })
      
  new AddContact()
