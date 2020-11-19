function extend(destinationObj, ...extenders) {
  extenders.forEach(extensionObj => {
    Object.getOwnPropertyNames(extensionObj)
          .forEach(prop => {
            destinationObj[prop] = extensionObj[prop];
          });
  });

  return destinationObj;
}

let foo = {
  a: 0,
  b: { x: 1, y: 2, },
};

let joe = { name: 'Joe', };

let funcs = {
  sayHello() { console.log('Hello, ' + this.name); },
  sayGoodBye() { console.log('Goodbye,' + this.name); },
};

let object = extend({}, foo, joe, funcs);

console.log(object.b.x);  // 1
object.sayHello();        // Hello, Joe