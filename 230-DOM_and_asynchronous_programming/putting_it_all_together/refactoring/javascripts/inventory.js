let inventory;

(function() {
  inventory = {
    lastId: 0,
    collection: [],
    setDate: function() {
      let date = new Date();
      let orderDate = document.getElementById('order_date');
      orderDate.textContent = date.toUTCString();
    },
    cacheTemplate: function() {
      let iTmpl = document.getElementById('inventory_item');
      this.template = Handlebars.compile(iTmpl.innerHTML);
      iTmpl.remove();
    },
    add: function() {
      this.lastId++;
      let item = {
        id: this.lastId,
        name: '',
        stock_number: '',
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
      let found_item;

      this.collection.forEach(function(item) {
        if (item.id === id) {
          found_item = item;
          return false;
        }
      });

      return found_item;
    },
    update: function(itemRow) {
      let id = this.findID(itemRow);
      let item = this.get(id);

      item.name         = itemRow.querySelector('[name^=item_name]').value;
      item.stock_number = itemRow.querySelector('[name^=item_stock_number]').value;
      item.quantity     = itemRow.querySelector('[name^=item_quantity]').value;
    },
    newItem: function(e) {
      e.preventDefault();
      let item = this.add();
      let inventory = document.getElementById('inventory');
      
      inventory.insertAdjacentHTML('beforeend', this.template({ id: item.id }));
    },
    findParent: function(e) {
      return e.target.closest('tr');
    },
    findID: function(item) {
      // the + sign coerces to numeric
      return +item.querySelector('input[type=hidden]').value;
    },
    deleteItem: function(e) {
      e.preventDefault();
      if (e.target.classList.contains('delete')) {
        let item = this.findParent(e);
        this.remove(this.findID(item));
        item.remove();
      }
    },
    updateItem: function(e) {
      if (event.target.tagName === 'INPUT') {
        let item = this.findParent(e);
        this.update(item);
      }
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

document.addEventListener('DOMContentLoaded', () => {
  inventory.init.bind(inventory)();
});