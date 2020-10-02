function substring(string, start, end) {
  if (end === undefined) {
    end = string.length;
  }

  if (start < 0 || Number.isNaN(start)) {
    start = 0;
  }

  if (end < 0 || Number.isNaN(end)) {
    end = 0;
  }

  if (start > end) {
    [start, end] = [end, start];
  }

  if (start > string.length) {
    start = string.length;
  }

  if (end > string.length) {
    end = string.length;
  }

  let newString = '';
  for (let index = start; index < end; index += 1) {
    newString += string[index];
  }

  return newString;
}

let string = 'hello world';

console.log(substring(string, 2, 4) === 'll');    // "ll"
console.log(substring(string, 4, 2) === 'll');    // "ll"
console.log(substring(string, 0, -1) === '');   // ""
console.log(substring(string, 2) === 'llo world');       // "llo world"
console.log(substring(string, 'a') === 'hello world');     // "hello world"
console.log(substring(string, 8, 20) === 'rld');   // "rld"