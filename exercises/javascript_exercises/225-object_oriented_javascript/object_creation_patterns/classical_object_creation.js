// Person pseudo-class
function Person(firstName, lastName, age, gender) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.age = age;
  this.gender = gender;
}

Person.prototype.fullName = function() {
  return `${this.firstName} ${this.lastName}`;
};

Person.prototype.communicate = function() {
  console.log(`${this.fullName()} tries to communicate`);
};

Person.prototype.eat = function() {
  console.log(`${this.fullName()} eats`);
};

Person.prototype.sleep = function() {
  console.log(`${this.fullName()} goes to sleep`);
};

// Doctor pseudo-class
function Doctor(firstName, lastName, age, gender, specialization) {
  Person.call(this, firstName, lastName, age, gender);
  this.specialization = specialization;
}

Doctor.prototype = Object.create(Person.prototype);
Doctor.prototype.constructor = Doctor;

Doctor.prototype.diagnose = function() {
  console.log(`${this.fullName()} rubs their chin`);
};

// Professor pseudo-class
function Professor(firstName, lastName, age, gender, subject) {
  Person.call(this, firstName, lastName, age, gender);
  this.subject = subject;
}
Professor.prototype = Object.create(Person.prototype);
Professor.prototype.constructor = Professor;

Professor.prototype.teach = function() {
  console.log(`${this.fullName()} pontificates`);
};

// Student pseudo-class
function Student(firstName, lastName, age, gender, degree) {
  Person.call(this, firstName, lastName, age, gender);
  this.degree = degree;
}
Student.prototype = Object.create(Person.prototype);
Student.prototype.constructor = Student;

Student.prototype.study = function() {
  console.log(`${this.fullName()} hits the books`);
};

// GraduateStudent pseudo-class
function GraduateStudent(firstName, lastName, age, gender, degree, graduateDegree) {
  Student.call(this, firstName, lastName, age, gender, degree);
  this.graduateDegree = graduateDegree;
}
GraduateStudent.prototype = Object.create(Student.prototype);
GraduateStudent.prototype.constructor = GraduateStudent;

GraduateStudent.prototype.research = function() {
  console.log(`${this.fullName()} REALLY hits the books`);
};

const person = new Person('foo', 'bar', 21, 'gender');
console.log(person instanceof Person);
person.eat();                           // logs 'foo bar eats'
person.communicate();                   // logs 'foo bar tries to communicate
person.sleep();                         // logs 'foo bar goes to sleep'
console.log(person.fullName());         // logs 'foo bar'

const doctor = new Doctor('Dr. foo', 'bar', 21, 'gender', 'Pediatrics');
console.log(doctor instanceof Person);
console.log(doctor instanceof Doctor);
doctor.eat();                           // logs 'Dr. foo bar eats'
doctor.communicate();                   // logs 'Dr. foo bar tries to communicate
doctor.sleep();                         // logs 'Dr. foo bar goes to sleep'
console.log(doctor.fullName());         // logs 'Dr. foo bar'
doctor.diagnose();                      // logs 'Dr. foo bar rubs their chin'

const graduateStudent = new GraduateStudent('sleepy foo','bar', 21, 'gender', 'BS CS', 'MS CS');

console.log(graduateStudent instanceof Person);
console.log(graduateStudent instanceof Student);
console.log(graduateStudent instanceof GraduateStudent);
graduateStudent.eat();                    // logs 'sleepy foo bar eats'
graduateStudent.communicate();            // logs 'sleepy foo bar tries to communicate'
graduateStudent.sleep();                  // logs 'sleepy foo bar goes to sleep'
console.log(graduateStudent.fullName());  // logs 'sleepy foo bar'
graduateStudent.study();                  // logs 'sleepy foo bar hits the books'
graduateStudent.research();               // logs 'sleepy foo bar REALLY hits the books'