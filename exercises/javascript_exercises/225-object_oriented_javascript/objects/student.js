function createStudent(name, year) {
  return {
    name,
    year,
    enrolledCourses: [],
    info() {
      console.log(`${name} is a ${year} student`);
    },
    addCourse(courseObj) {
      this.enrolledCourses.push(courseObj);
    },
    listCourses() {
      console.log(this.enrolledCourses);
    },
    addNote(code, note) {
      this.enrolledCourses.filter(course => course['code'] === code)
                          .forEach(course => {
                            if (course['note'] === undefined) {
                              course['note'] = note
                            } else {
                              course['note'] += `; ${note}`
                            };
                          });
    },
    viewNotes() {
      let coursesWithNotes = this.enrolledCourses.filter(course => course['note'] !== undefined);
      coursesWithNotes.forEach(course => {
        console.log(`${course.name}: ${course.note}`);
      });
    },
    updateNote(code, note) {
      this.enrolledCourses.filter(course => course['code'] === code)
                          .forEach(course => course['note'] = note);
    }
  };
}

foo = createStudent('Foo', '1st');
foo.info();
foo.listCourses();
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
foo.listCourses();
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
foo.updateNote(101, 'Fun course');
foo.viewNotes();