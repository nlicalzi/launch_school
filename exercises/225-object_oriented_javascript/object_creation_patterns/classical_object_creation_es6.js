// Refactored solution using the ES6 `class` syntactic sugar

class Person {
  constructor(firstName, lastName, age, gender) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
    this.gender = gender;
  }

  fullName() {
    return `${this.firstName} ${this.lastName}`;
  }

  communicate() {
    console.log(`${this.fullName()} tries to communicate`);
  }

  eat() {
    console.log(`${this.fullName()} eats`);
  }

  sleep() {
    console.log(`${this.fullName()} goes to sleep`);
  }
}

class Doctor extends Person {
  constructor(firstName, lastName, age, gender, specialization) {
    super(firstName, lastName, age, gender);
    this.specialization = specialization;
  }

  diagnose() {
    console.log(`${this.fullName()} rubs their chin`);
  }
}

class Professor extends Person {
  constructor(firstName, lastName, age, gender, subject) {
    super(firstName, lastName, age, gender);
    this.subject = subject;
  }

  teach() {
    console.log(`${this.fullName()} pontificates`);
  }
}

class Student extends Person {
  constructor(firstName, lastName, age, gender, degree) {
    super(firstName, lastName, age, gender);
    this.degree = degree;
  }

  study() {
    console.log(`${this.fullName()} hits the books`);
  }
}

class GraduateStudent extends Student {
  constructor(firstName, lastName, age, gender, degree, graduateDegree) {
    super(firstName, lastName, age, gender, degree);
    this.graduateDegree = graduateDegree;
  }

  research() {
    console.log(`${this.fullName()} REALLY hits the books`);
  }
}

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