define [
  'jquery', 
  'underscore', 
  'backbone',
  'cs!views/contactView'
  'cs!collections/contacts' 
  'text!templates/contactsListView.html'
], ($, _, Backbone, ContactView, contacts, contactsViewTemplate) ->
  class ContactsListView extends Backbone.View
    el: "#contactsRegion"
    initialize: ->
      #replace with 'contacts'
      @collection = contacts
      
      @collection.bind('reset', @addAll, this);
      @collection.bind('add', @addOne, this);
      
      #get from server:
      this.collection.fetch();      
      
    addOne: (contact) ->
      view = new ContactView({model:contact});
      $("#contacts-list").append(view.render().el);
      
    addAll: ->
      @collection.each(@addOne)
    
    render: ->
      $(@el).html(contactsViewTemplate)
      
  new ContactsListView()