function triangle(num) {
  for (let stars = 1; stars <= num; stars += 1) {
    let spaces = num - stars;
    console.log(' '.repeat(spaces) + '*'.repeat(stars));
  }
}

triangle(5);
triangle(9);