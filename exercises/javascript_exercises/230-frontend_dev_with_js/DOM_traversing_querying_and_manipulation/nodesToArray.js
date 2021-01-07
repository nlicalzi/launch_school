function nodesToArr(node = document.body) {
  let children = [...node.children];
  return [node.tagName, children.map(nodesToArr)];
}

console.log(JSON.stringify(nodesToArr()));