// https://launchschool.com/exercises/d6d3971a

// Build a simple inventory management system.
// The system is composed of an item creator, an items manager, and a reports manager.
// The item creator makes sure that all necessary information are present and valid.
// The item manager is responsible for creating items, updating information about items,
// deleting items, and querying information about the items.
// Finally, the report manager generates reports for a specific item or ALL items.

// Reports for specific items are generated from report objects created from the report
// manager. The report manager is responsible for reports for all items.

function ItemCreator() {
  // PROPERTIES
    // SKU code (UID/str):
      // first 3 letters of item name (trim spaces), first 2 letters of category
    // Item Name (str):
      // min 5 non-space characters
    // Category (str):
      // min 5 chars, no spaces allowed
    // Quantity (num):
      // required value, assume valid number provided
}

function ItemManager() {
  // METHODS
    // create(), creates a new item (returns false if creation not successful)
    // update(SKU, obj), updates any of the info on an item (assume valid values)
    // delete(SKU), deletes the item from the list (assume valid SKU)
    // items(), return all items
    // inStock(), return all items with quantity > 0
    // itemsInCategory(category), list all items for given category
}

function ReportManager() {
  // PROPERTIES
    // items, should reference an itemManager object
  // METHODS
    // init(itemManager), assigns itemManager to `items` property
    // createReporter(SKU), returns an object having:
      // method itemInfo(), log all properties of obj as k:v pairs, one per line
    // reportInStock(), log all items in stock as comma separated values
}