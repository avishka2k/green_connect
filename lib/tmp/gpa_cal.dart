import 'package:flutter/material.dart';

class GPACalculator extends StatefulWidget {
  const GPACalculator({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GPACalculatorState createState() => _GPACalculatorState();
}

class _GPACalculatorState extends State<GPACalculator> {
  List<String> grades = ['A', 'A+', 'B', 'B+', 'C', 'C+', 'D', 'F'];
  int creditHours = 1;
  List<String> myGrades = [
    'A+',
    'A+',
    'A+',
    'F',
    'A+',
 
  ]; // Your array of grades
  List<double> gradePoints = [];
  double totalCreditHours = 0;
  double totalGradePoints = 0;
  double gpa = 0;

  @override
  void initState() {
    super.initState();
    calculateGPA(); // Calculate the GPA when the widget is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GPA Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Your Grades: ${myGrades.join(', ')}'),
            const SizedBox(height: 20),
            Text('GPA: ${gpa.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }

  void calculateGPA() {
    for (var grade in myGrades) {
      double gradePoint = getGradePoint(grade);
      totalGradePoints += gradePoint;
      totalCreditHours += creditHours;
    }
    gpa = totalGradePoints / totalCreditHours;
    setState(() {});
  }

  double getGradePoint(String grade) {
    switch (grade) {
      case 'A+':
        return 4.3;
      case 'A':
        return 4.0;
      case 'B+':
        return 3.3;
      case 'B':
        return 3.0;
      case 'C+':
        return 2.3;
      case 'C':
        return 2.0;
      case 'D':
        return 1.0;
      case 'F':
        return 0.0;
      default:
        return 0.0;
    }
  }
}
