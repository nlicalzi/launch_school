// write a function that colors a specific generation of the DOM tree (same-level)
// use the .generation-color class to color the generation
// only non-negative integers will be provided as args.

function colorGeneration(targetDepth) {
  let depth = 0;
  let parents = [document.body]; // first gen
  let elements;

  while (depth < targetDepth) {
    depth += 1;
    elements = getAllChildrenOf(parents);
    parents = elements;
  }

  if (elements) { color(elements); }
}

function color(els) {
  els.forEach(({classList}) => {
    classList.add('generation-color');
  });
}

function getAllChildrenOf(parents) {
  return parents.map(({children}) => Array.prototype.slice 
                                                    .call(children))
                                                    .reduce((collection, children) => collection.concat(children), []);
}

colorGeneration(2); // 4, 7, 12, 16