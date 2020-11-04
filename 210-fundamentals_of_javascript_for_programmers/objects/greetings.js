function greetings(name, job) {
  let fullName = name.join(' ');
  let title = job['title'];
  let occupation = job['occupation'];

  console.log(`Hello ${fullName}! Nice to have a ${title} ${occupation} around.`);
}

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' });
