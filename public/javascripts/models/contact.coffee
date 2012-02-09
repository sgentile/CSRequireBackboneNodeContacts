define [ "underscore", "backbone" ], (_, Backbone) ->
  class ContactModel extends Backbone.Model
    url: "Contact"
    defaults:
      id: null
      firstname: ""
      lastname: ""

    initialize: ->
      alert "initialized"