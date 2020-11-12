function makeList() {
  let todos = [];
  return function() {
    let todo = arguments[0];
    if (todo === undefined) { // passed without arg?
      if (todos.length === 0) {
        console.log('The list is empty.');
      } else {
        todos.forEach(todo => console.log(todo));
      }
    } else if (todos.includes(todo)) { // 
      let idx = todos.indexOf(todo);
      todos.splice(idx, 1);
      console.log(`${todo} removed!`)
    } else {
      todos.push(todo);
      console.log(`${todo} added!`)
    }
  };
}

let list = makeList();
list();
list('make breakfast');
list('read book');
list();
list('make breakfast');
list();