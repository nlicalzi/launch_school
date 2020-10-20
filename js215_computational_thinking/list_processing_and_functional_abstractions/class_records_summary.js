// p
  // prepare a class record summary for students, based on the weighted scores of exercises/exams
  // 1. compute the student's avg exam score (sum of scores / exam count)
  // 2. compute sum of exercise scores
  // 3. apply weights to determine final percentage grade
  // 4. round weighted score to nearest integer (exams: 65%, exercises: 35%)
  // 5. look up letter grade in table (if/else statement)
  // 6. combine the percent grade and letter grade: "81 (C)"
// e
// d
// a
// c


let studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

function generateClassRecordSummary(scores) {
  const studentGrades = [];
  let students = Object.keys(scores);
  students.forEach(studentName => {
    let studentScores = scores[studentName]['scores'];

    let examAvg = calculateExamAverage(studentScores['exams']);
    let exerciseTotal = studentScores['exercises'].reduce((sum, score) => sum + score);
    let weightedGrade = (examAvg * 0.65) + (exerciseTotal * 0.35);

    studentGrades.push(formatGrade(weightedGrade));
  });

  const exams = [];
  let studentScores = Object.values(scores).map(student => student['scores']['exams']);

  for (let idx = 0; idx < studentScores[0].length; idx += 1) {
    let results = studentScores.map(score => score[idx]);
    exams.push(calculateExamStatistics(results));
  }

  return { studentGrades, exams };
}

function calculateExamStatistics(examScores) {
  let total = examScores.reduce((sum, grade) => sum + grade);
  let avg = (total / examScores.length).toFixed(1);
  let min = Math.min(...examScores);
  let max = Math.max(...examScores);

  return { average: avg, minimum: min, maximum: max }
}

function calculateExamAverage(grades) {
  let total = grades.reduce((sum, grade) => sum + grade);
  return (total / grades.length).toFixed(1);
}

function formatGrade(grade) {
  let roundedGrade = Math.round(grade);

  if (grade > 92) {
    return `${roundedGrade} (A)`;
  } else if (grade > 84) {
    return `${roundedGrade} (B)`;
  } else if (grade > 76) {
    return `${roundedGrade} (C)`;
  } else if (grade > 68) {
    return `${roundedGrade} (D)`;
  } else if (grade > 59) {
    return `${roundedGrade} (E)`;
  } else {
    return `${roundedGrade} (F)`;
  }
}



console.log(generateClassRecordSummary(studentScores));

// returns:
// {
//   studentGrades: [ '87 (B)', '73 (D)', '84 (C)', '86 (B)', '56 (F)' ],
//   exams: [
//     { average: 75.6, minimum: 50, maximum: 100 },
//     { average: 86.4, minimum: 70, maximum: 100 },
//     { average: 87.6, minimum: 60, maximum: 100 },
//     { average: 91.8, minimum: 80, maximum: 100 },
//   ],
// }