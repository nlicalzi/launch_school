// https://launchschool.com/exercises/d6d3971a

// Build a simple inventory management system.
// The system is composed of an item creator, an items manager, and a reports manager.
// The item creator makes sure that all necessary information are present and valid.
// The item manager is responsible for creating items, updating information about items,
// deleting items, and querying information about the items.
// Finally, the report manager generates reports for a specific item or ALL items.

// Reports for specific items are generated from report objects created from the report
// manager. The report manager is responsible for reports for all items.

class Item {
  constructor(itemName, category, quantity) {
    if (!this.#validName(itemName) ||
        !this.#validCategory(category) ||
        !this.#validQuantity(quantity)) {
      return {
        notValid: true,
      };
    } else {
      this.itemName = itemName;
      this.category = category;
      this.quantity = quantity;
      this.SKU = (itemName.replace(/\s/g, '').substring(0, 3) +
                 category.substring(0, 2)).toUpperCase();
    }
  }

  // PRIVATE VALIDATION METHODS (prefixed with #)
  #validName(str) {
    return str.replace(/\s/g, '').length > 5;
  }
  #validCategory(str) {
    return str.length > 5 && str.indexOf(' ') === -1;
  }
  #validQuantity(num) {
    return num >= 0;
  }
}

class ItemManager {
  constructor() {
    this.inventory = [];
  }

  create(itemName, category, quantity) {
    let item = new Item(itemName, category, quantity)
    if (!item.notValid) {
      this.inventory.push(item);
      return item;
    } else {
      return false;
    }
  }
  getItem(SKUCode) {
    return this.inventory.filter(item => item.SKU === SKUCode)[0];
  }
  items() {
    return this.inventory;
  }
  update(targetSKU, obj) {
    this.inventory.forEach(item => {
      if (item.SKU === targetSKU) {
        for (let prop in obj) { item[prop] = obj[prop]; }
      }
    });
  }
  delete(targetSKU) {
    this.inventory = this.inventory.filter(item => item.SKU !== targetSKU);
  }
  inStock() {
    return this.inventory.filter(item => item.quantity > 0);
  }
  itemsInCategory(targetCategory) {
    return this.inventory.filter(item => item.category === targetCategory);
  }
}

class ReportManager {
  constructor(itemManager) {
    this.items = itemManager;
  }

  createReporter(targetSKU) {
    return (() => {
      const item = this.items.getItem(targetSKU);
      return {
        itemInfo() {
          Object.keys(item).forEach(key => {
            console.log(`${key}: ${item[key]}`);
          });
        },
      };
    })();
  }

  reportInStock() {
    console.log(this.items.inventory.filter(item => item.quantity > 0)
                                    .map(item => item.itemName)
                                    .join(', '));
  }
}

let manager = new ItemManager();

manager.create('basket ball', 'sports', 0);           // valid item
manager.create('asd', 'sports', 0);
manager.create('soccer ball', 'sports', 5);           // valid item
manager.create('football', 'sports');
manager.create('football', 'sports', 3);              // valid item
manager.create('kitchen pot', 'cooking items', 0);
manager.create('kitchen pot', 'cooking', 3);          // valid item

console.log(manager.items());

let reportManager = new ReportManager(manager);
reportManager.reportInStock();

manager.update('SOCSP', { quantity: 0 });
console.log(manager.inStock());
reportManager.reportInStock();

console.log(manager.itemsInCategory('sports'));
manager.delete('SOCSP');
console.log(manager.items());

const kitchenPotReporter = reportManager.createReporter('KITCO');
kitchenPotReporter.itemInfo();

manager.update('KITCO', { quantity: 10 });
kitchenPotReporter.itemInfo();