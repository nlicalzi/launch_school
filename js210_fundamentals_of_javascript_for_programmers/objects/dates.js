// 1: Create a variable named today with the current date and time as its value
let today = new Date();

// 2: Log a string "Today's date is ${num}" using getDay to get the number of the day
console.log(`Today's date is ${today.getDay()}`);

// 3: Modify the output of the previous problem to show the 3 letter day abbreviation
let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
let dayOfWeek = daysOfWeek[today.getDay()];
console.log(`Today's date is ${dayOfWeek}`);

// 4: Log "Today's date is dayOfWeek, the dayOfMonth"
let dayOfMonth = today.getDate();
console.log(`Today's date is ${dayOfWeek}, the ${dayOfMonth}`);

// 5: Add a proper suffix to day of month with a dateSuffix function
function dateSuffix(date) {
  if ((date === 1) || (date === 21) || (date === 31)) {
    return 'st';
  } else if ((date === 2) || (date === 22)) {
    return 'nd';
  } else if ((date === 3) || (date === 23)) {
    return 'rd';
  } else {
    return 'th';
  }
}
console.log(`Today's date is ${dayOfWeek}, the ${dayOfMonth}${dateSuffix(dayOfMonth)}`);

// 6: Add the month
let month = today.getMonth();
console.log(`Today's date is ${dayOfWeek}, ${month} ${dayOfMonth}${dateSuffix(dayOfMonth)}`);

// 7: Make the month readable
let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
              'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
console.log(`Today's date is ${dayOfWeek}, ${months[month]} ${dayOfMonth}${dateSuffix(dayOfMonth)}`);

// 8: Clean up our code a bit
function formattedMonth(date) {
  let months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
              'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  return months[date.getMonth()];
}

function formattedDay(date) {
  return String(date.getDate()) + dateSuffix(date);
}

function formattedDate(date) {
  let daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  let dayOfWeek = daysOfWeek[today.getDay()];

  console.log(`Today's date is ${dayOfWeek}, ${formattedMonth(date)} ${formattedDay(date)}`)
}

formattedDate(today);

// 9: Log the values returned from getFullYear and getYear
console.log(today.getFullYear());
console.log(today.getYear()); // this is deprecated

// 10: Use the getTime method and log the current date and time in total MS since Jan 1 1970
console.log(today.getTime());

// 11: 
let tomorrow = new Date(today.getTime());

tomorrow.setDate(today.getDate() + 1);
formattedDate(tomorrow);

// 12: 
let nextWeek = new Date(today.getTime());
console.log(nextWeek === today); // false

// 13: 
console.log(today.toDateString() === nextWeek.toDateString()); // true
nextWeek.setDate(today.getDate() + 7);
console.log(today.toDateString() === nextWeek.toDateString()); // false

// 14: Finally, write a function named formatTime that takes a date object as an argument
//     and returns a string formatted with the hours and minutes as "15:30". 
function formatTime(date) {
  return addZero(date.getHours()) + ':' + addZero(date.getMinutes());
}

function addZero(value) {
  let timeComponent = String(value);
  return timeComponent.length < 2 ? '0' + timeComponent : timeComponent;
}

// Date value passed: 2013-03-01T01:10:00
console.log(formatTime(new Date(2013, 2, 1, 1, 10)));