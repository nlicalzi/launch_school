// Adding the mixin Professional to the ES6 solution
function extend(targetObj, mixin) {
  return Object.assign(targetObj, mixin);
}

const Professional = {
  invoice() {
    console.log(`${this.fullName()} is billing a customer`);
  },

  payTax() {
    console.log(`${this.fullName()} sits down with their CPA`);
  }
};

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

const doctor = extend(new Doctor('foo', 'bar', 21, 'gender', 'Pediatrics'), Professional);
console.log(doctor instanceof Person);
console.log(doctor instanceof Doctor);
doctor.eat();
doctor.communicate();
doctor.sleep();
console.log(doctor.fullName());
doctor.diagnose();

const professor = extend(new Professor('foo', 'bar', 21, 'gender', 'Systems Engineering'), Professional);
console.log(professor instanceof Person);
console.log(professor instanceof Professor);
professor.eat();
professor.communicate();
professor.sleep();
console.log(professor.fullName());
professor.teach();

doctor.invoice();
doctor.payTax();

doctor.invoice();
professor.invoice();
professor.payTax();