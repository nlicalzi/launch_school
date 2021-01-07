// Building on the previous exercise, write a function that returns true or false based on
// whether or not an inventory item is available. As before, the function takes two
// arguments: an inventory item and a list of transactions. The function should return
// true only if the sum of the quantity values of the item's transactions is greater than
// zero. Notice that there is a movement property in each transaction object. A movement
// value of 'out' will decrease the item's quantity.

function isItemAvailable(inventoryItem, transactions) {
  let itemLogs = transactionsFor(inventoryItem, transactions);
  let itemCount = 0;

  itemLogs.forEach(transaction => {
    if (transaction['movement'] === 'in') {
      itemCount += transaction['quantity'];
    } else {
      itemCount -= transaction['quantity'];
    }
  });

  return itemCount > 0;
}

function transactionsFor(inventoryItem, transactions) {
  return transactions.filter(transaction => transaction['id'] === inventoryItem);
}

const transactions = [ { id: 101, movement: 'in',  quantity:  5 },
                       { id: 105, movement: 'in',  quantity: 10 },
                       { id: 102, movement: 'out', quantity: 17 },
                       { id: 101, movement: 'in',  quantity: 12 },
                       { id: 103, movement: 'out', quantity: 15 },
                       { id: 102, movement: 'out', quantity: 15 },
                       { id: 105, movement: 'in',  quantity: 25 },
                       { id: 101, movement: 'out', quantity: 18 },
                       { id: 102, movement: 'in',  quantity: 22 },
                       { id: 103, movement: 'out', quantity: 15 }, ];

console.log(isItemAvailable(101, transactions) === false);     // false
console.log(isItemAvailable(105, transactions) === true);     // true