function makeList() {
  return {
    items: [],
    list: function() {
      this.items.forEach(item => console.log(item));
    },
    add: function(item) {
      this.items.push(item);
      console.log(`${item} added!`);
    },
    remove: function(item) {
      let idx = this.items.indexOf(item);
      if (idx !== -1) {
        this.items.splice(idx, 1);
        console.log(`${item} removed!`);
      } else {
        console.log(`${item} not found`);
      }
    },
  };
}

let list = makeList();
list.add('peas');     // peas added!
list.list();          // peas
list.add('corn');     // corn added!
list.list();          // peas \n corn
list.remove('peas');  // peas removed!
list.list();          // corn
list.remove('beans')  // beans not found