function arrayToNodes(nodes) {
  const parent = document.createElement(nodes[0]);
  const children = nodes[1];

  if (children.length === 0) {
    return parent;
  } else {
    for (let idx = 0; idx < children.length; idx += 1) {
      parent.appendChild(arrayToNodes(children[idx]));
    }
  }

  return parent;
}

const nodes = ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]];
console.log(arrayToNodes(nodes));