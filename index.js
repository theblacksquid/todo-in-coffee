// Generated by CoffeeScript 1.10.0
(function() {
  var Item, List, list_view, template,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Item = (function(superClass) {
    extend(Item, superClass);

    function Item() {
      return Item.__super__.constructor.apply(this, arguments);
    }

    Item.prototype.defaults = {
      title: "",
      completed: false
    };

    return Item;

  })(Backbone.Model);

  List = (function(superClass) {
    extend(List, superClass);

    function List() {
      return List.__super__.constructor.apply(this, arguments);
    }

    List.prototype.model = Item;

    return List;

  })(Backbone.Collection);

  template = function(input) {
    return "<li>" + input + "</li>";
  };

  window.ListView = (function(superClass) {
    extend(ListView, superClass);

    function ListView() {
      return ListView.__super__.constructor.apply(this, arguments);
    }

    ListView.prototype.el = $('body');

    ListView.prototype.events = {
      "click button": "appendItem"
    };

    ListView.prototype.initialize = function() {
      this.list = new List;
      return this.render();
    };

    ListView.prototype.render = function() {
      $(this.el).html("<div id='app'></div>");
      $("#app").append("<button>Add Item</button>");
      $("#app").append("<input type='text' />");
      $('#app').append("<ul id='list'></ul>");
      return this;
    };

    ListView.prototype.appendItem = function() {
      var input, item;
      console.log("button pressed");
      item = new Item;
      input = $('input').val();
      item.set("title", input);
      this.list.add(item);
      $("#list").append(template(input));
      return console.log(item.get('title'));
    };

    return ListView;

  })(Backbone.View);

  list_view = new ListView;

}).call(this);
