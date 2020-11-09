function invoiceTotal(amount1, amount2, amount3, amount4) {
  return amount1 + amount2 + amount3 + amount4;
}

console.log(invoiceTotal(20, 30, 40, 50));         // works as expected
console.log(invoiceTotal(20, 30, 40, 50, 40, 40)); // does not work, how can we make it work?

function newInvoiceTotal(...args) { // fix by using a rest parameter
  return args.reduce((a, b) => a + b, 0);
}

console.log(newInvoiceTotal(20, 30, 40, 50));
console.log(newInvoiceTotal(20, 30, 40, 50, 40, 40));