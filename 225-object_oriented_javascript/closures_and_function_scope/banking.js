function makeBank() {
  let latestAccount = 101;
  let accounts = [];

  function makeAccount(number) {
    let balance = 0;
    let transactions = [];

    return {
      number,
      balance: 0,
      transactions: [],

      balance() {
        return balance;
      },

      number() {
        return number;
      },

      transactions() {
        return transactions;
      },
    
      transaction(type, amount) {
        return { type, amount };
      },
    
      deposit(amount) {
        this.balance += amount;
        transactions.push(this.transaction('deposit', amount));
        return amount;
      },
    
      withdraw(amount) {
        if (amount > this.balance) { amount = this.balance; }
        this.balance -= amount;
        transactions.push(this.transaction('withdrawal', amount));
        return amount;
      },
    };
  }

  return {
    openAccount() {
      let account = makeAccount(latestAccount);
      accounts.push(account);
      latestAccount += 1;
      return account;
    },

    transfer(source, destination, amt) {
      return destination.deposit(source.withdraw(amt));
    },
  };
}

let bank = makeBank();

let account = bank.openAccount();
console.log(account.balance());
console.log(account.deposit(17));

let secondAccount = bank.openAccount();
console.log(secondAccount.number());
console.log(account.transactions());

console.log(bank.accounts);
