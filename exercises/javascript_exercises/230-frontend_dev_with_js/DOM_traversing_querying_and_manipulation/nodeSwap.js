function nodeSwap(firstID, secondID) {
  let node1  = document.getElementById(firstID);
  let node2 = document.getElementById(secondID);

  // if either node doesn't exist
  if (!node1 || !node2) { return undefined; } 
  // if either node is an ancestor of the other
  if (isChildNodeOfAncestor(node1, node2) || isChildNodeOfAncestor(node2, node1)) {
    return undefined; 
  };
  
  let afterNode2 = node2.nextElementSibling;
  let parentOfNode2 = node2.parentNode;
  node1.replaceWith(node2);
  parentOfNode2.insertBefore(node1, afterNode2);
}

function isChildNodeOfAncestor(node, ancestor) {
  let ancestors = [];
  while (node) {
    ancestors.unshift(node);
    node = node.parentNode;
  }

  return ancestors.includes(node);
}

nodeSwap(3, 1);
nodeSwap(7, 9);