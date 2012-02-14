define [
  'jquery', 
  'underscore', 
  'backbone',
  'cs!collections/contacts',
  'text!templates/addContactView.html',
  'jqueryvalidate'
], ($, _, Backbone, contacts, addContactViewTemplate) ->
   class AddContact extends Backbone.View
     el: "#addContactRegion"
     events: {
      'submit #addContactForm' : 'addContact'
     }
     render: ->
       $(@el).html(addContactViewTemplate)
       $("#addContactForm").validate(
        errorClass:'error'
        validClass:'success'
        errorElement:'span'      
        highlight: (element, errorClass, validClass) ->
          $(element).parent('div').parent('div').removeClass(validClass).addClass(errorClass)
        unhighlight: (element, errorClass, validClass) ->
          $(element).parent('div').parent('div').removeClass(errorClass).addClass(validClass)
       )  
       
       
     addContact: (e) ->
       e.preventDefault() #don't return for a form post   
         
       newContact = {
         firstname:  $("#firstname").val(),
         lastname:   $("#lastname").val()
       }
       contacts.create(newContact, {
         success: (model, response) ->
           $("#firstname").val("")
           $("#lastname").val("")
           $("#firstname").focus()
         error: ->
           alert('error')
       })
       
   new AddContact()
      
