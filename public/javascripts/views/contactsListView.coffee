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
      @collection.bind("changed", @changed, this);
      
      #get from server:
      this.collection.fetch();      
    
    changed: (contact) ->
      alert('changed')
       
    addOne: (contact) ->
      view = new ContactView({model:contact});
      $("#contacts-list").append(view.render().el);
      
    addAll: ->
      @collection.each(@addOne)
    
    render: ->
      $(@el).html(contactsViewTemplate)
      
  new ContactsListView()