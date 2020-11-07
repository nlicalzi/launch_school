let invoices = {
  paid: [],
  unpaid: [],
  add: function(clientName, amountOwed) {
    this.unpaid.push( { clientName, amountOwed }); // ES6 property shorthand
  },
  payInvoice: function(clientName) {
    let stillUnpaid = [];
    this.unpaid.forEach(invoice => {
      if (clientName === invoice.clientName) {
        this.paid.push(invoice)
      } else {
        stillUnpaid.push(invoice)
      };
    });
    this.unpaid = stillUnpaid;
  },
  totalDue: function() {
    return this.unpaid.map(invoice => invoice.amountOwed)
                      .reduce((a, b) => a + b);
  },
  totalPaid: function() {
    return this.paid.map(invoice => invoice.amountOwed)
                    .reduce((a, b) => a + b);
  },
};

invoices.add('Due North Development', 250);
invoices.add('Moonbeam Interactive', 187.5);
invoices.add('Slough Digital', 300);
console.log('Total due is: $' + invoices.totalDue());

invoices.payInvoice('Due North Development');
invoices.payInvoice('Slough Digital');
console.log('\nTotal paid: $' + invoices.totalPaid());
console.log('Total due after payments is: $' + invoices.totalDue());
