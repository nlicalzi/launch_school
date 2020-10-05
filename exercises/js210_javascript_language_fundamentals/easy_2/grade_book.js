function getGrade(first, second, third) {
  const avg = (first + second + third) / 3;
  if (avg >= 90) {
    return 'A'
  } else if (avg >= 80) {
    return 'B'
  } else if (avg >= 70) {
    return 'C'
  } else if (avg >= 60) {
    return 'D'
  } else {
    return 'F'
  }
}

console.log(getGrade(95, 90, 93) === 'A');    // "A"
console.log(getGrade(50, 50, 95) === 'D');    // "D"
