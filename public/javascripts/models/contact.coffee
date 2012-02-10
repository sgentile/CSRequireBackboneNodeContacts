define [ "underscore", "backbone" ], (_, Backbone) ->
  class ContactModel extends Backbone.Model
    urlRoot: "Contact"
    defaults:
      id: null
      firstname: ""
      lastname: ""
      