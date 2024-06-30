Flutter Training Resource

flutter create grade_calculator // com.example.grade_cal
flutter create --org com.david grade_calculator
View Github

Structure:
Input Screen: Enter scores for different subjects.
 Result Screen: Display average score and grade.
(entry.dart (8), display.dart, data.dart)

Steps:
Create input fields for subject scores.
[x] list of subjects
[ ] (8 Textfields)
button - take us to results/ display

Table/DataTable


Calculate the average score.

user math.dart - package
Display the average and corresponding grade.

if else
// Grade.
 if (marks > 90){
    return 'A';
 } else if( marks >= 65){
    return 'B';
 }
// use map (key: value)

Map grading = {
    'A' : 90,
    'B'  : 65,
}


