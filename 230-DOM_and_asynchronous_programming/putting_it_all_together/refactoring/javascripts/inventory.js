var inventory;

(function() {
  inventory = {
    lastId: 0,
    collection: [],
    setDate: function() {
      var date = new Date();
      let orderDate = document.getElementById('order_date');
      orderDate.textContent = date.toUTCString();
    },
    cacheTemplate: function() {
      let inventoryItem = document.getElementById('inventory_item')
      var iTmpl = inventoryItem.parentNode.removeChild(inventoryItem);
      this.template = iTmpl.innerHTML;
    },
    add: function() {
      this.lastId++;
      var item = {
        id: this.lastId,
        name: "",
        stock_number: "",
        quantity: 1
      };
      this.collection.push(item);

      return item;
    },
    remove: function(idx) {
      this.collection = this.collection.filter(function(item) {
        return item.id !== idx;
      });
    },
    get: function(id) {
      var found_item;

      this.collection.forEach(function(item) {
        if (item.id === id) {
          found_item = item;
          return false;
        }
      });

      return found_item;
    },
    // Takes a passed jQuery object as argument
    update: function($item) {
      // JQUERY
      var id = this.findID($item),
          item = this.get(id);

      // JQUERY
      item.name = $item.find("[name^=item_name]").val();
      // JQUERY
      item.stock_number = $item.find("[name^=item_stock_number]").val();
      // JQUERY
      item.quantity = $item.find("[name^=item_quantity]").val();
    },
    newItem: function(e) {
      e.preventDefault();
      var item = this.add(),
          // jQuery object
          $item = $(this.template.replace(/ID/g, item.id));

      // jQuery append method
      $("#inventory").append($item);
    },
    // use jQuery closest()
    findParent: function(e) {
      return $(e.target).closest("tr");
    },
    findID: function($item) {
      // the + sign coerces to numeric
      // jQuery find() method and val() method
      return +$item.find("input[type=hidden]").val();
    },
    deleteItem: function(e) {
      e.preventDefault();
      if (e.target.classList.contains('delete')) {
        let item = this.findParent(e);
        this.remove(this.findID(item));
        item.remove();
      }
    },
    // should be clean once the `this` methods are fixed; strip the $ from item
    updateItem: function(e) {
      let item = this.findParent(e);
      this.update(item);
    },
    bindEvents: function() {
      let add_item = document.getElementById('add_item');
      let inventory = document.getElementById('inventory');

      add_item.addEventListener('click', this.newItem.bind(this));
      inventory.addEventListener('click', this.deleteItem.bind(this));
      inventory.addEventListener('focusout', this.updateItem.bind(this));
    },
    init: function() {
      this.setDate();
      this.cacheTemplate();
      this.bindEvents();
    }
  };
})();

// use jQuery proxy method and return jQuery object
$($.proxy(inventory.init, inventory));
