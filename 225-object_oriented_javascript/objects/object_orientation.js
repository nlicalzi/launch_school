function createProduct(id, name, stock, price) {
  return {
    id,
    name,
    stock,
    price,
    setProductPrice(newPrice) {
      if (newPrice >= 0) {
        this.price = newPrice;
      } else {
        alert('Invalid price!');
      }
    },
    describe() {
      console.log(`ID: ${this.id}`);
      console.log(`Name: ${this.name}`);
      console.log(`Stock: ${this.stock}`);
      console.log(`Price: $${this.price}`);
    }
  };
}

let scissors = createProduct(0, 'Scissors', 8, 10);
let drill = createProduct(1, 'Cordless Drill', 15, 45);

console.log([scissors, drill]);

scissors.describe();

console.log("\nWe're having a flash sale on scissors!\n");
scissors.setProductPrice(4);

scissors.describe();