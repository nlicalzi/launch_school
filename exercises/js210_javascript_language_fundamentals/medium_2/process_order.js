function processOrder(price, quantity, discount, serviceCharge, tax) {
  if (!quantity) { // the issue occurs when one of the args passed is 0
    quantity = 1;
  }

  if (!discount) { // since 0 is falsy, these negated boolean statements evaluate to false
    discount = 0;
  }

  if (!serviceCharge) { // better to test whether an arg is undefined, rather than 0
    serviceCharge = 0.1;
  }

  if (!tax) {
    tax = 0.15;
  }

  return (price * quantity) * (1 - discount) * (1 + serviceCharge) * (1 + tax);
}

processOrder(100);