(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["underscore", "backbone"], function(_, Backbone) {
    var ContactModel;
    return ContactModel = (function(_super) {

      __extends(ContactModel, _super);

      function ContactModel() {
        ContactModel.__super__.constructor.apply(this, arguments);
      }

      ContactModel.prototype.url = "Contact";

      ContactModel.prototype.defaults = {
        id: null,
        firstname: "",
        lastname: ""
      };

      ContactModel.prototype.initialize = function() {
        return alert("initialized");
      };

      return ContactModel;

    })(Backbone.Model);
  });

}).call(this);
