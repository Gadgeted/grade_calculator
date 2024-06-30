List subjects = [
  'Maths',
  'English',
  'Kiswahili',
  'Biology',
  'Chemistry',
  'Physics',
  'History and Government',
  'Geography',
  'Christian Religious Education (CRE)',
];

String determineGrade(double average) {
  if (average >= 90) {
    return 'A';
  } else if (average >= 60) {
    return 'B';
  } else if (average >= 40) {
    return 'C';
  } else if (average >= 20) {
    return 'D';
  } else {
    return 'F';
  }
}