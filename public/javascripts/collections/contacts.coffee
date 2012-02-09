define [ "jquery", "underscore", "backbone", "models/contact" ], 
($, _, Backbone, contact) ->
  class ContactsCollection extends Backbone.Collection
    url: "Contact"
    model: contact
  
  new ContactsCollection