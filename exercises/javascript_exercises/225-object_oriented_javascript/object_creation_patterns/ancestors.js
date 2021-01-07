Object.prototype.ancestors = function ancestors() {
  let ancestors = ['Object.prototype'];
  let ancestor = Object.getPrototypeOf(this)
  while (ancestor !== Object.prototype) {
    ancestors.push(ancestor.name);
    ancestor = Object.getPrototypeOf(ancestor);
  };
  return ancestors;
}

const foo = { name: 'foo' };

const bar = Object.create(foo);
bar.name = 'bar';

const baz = Object.create(bar);
baz.name = 'baz';

const qux = Object.create(baz);
qux.name = 'qux';

console.log(qux.ancestors());
console.log(baz.ancestors());
console.log(bar.ancestors());
console.log(foo.ancestors());