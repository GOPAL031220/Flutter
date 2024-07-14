import 'dart:io';

void main() {
  double total = 0;
  for (int i = 1; i <= 5; i++) {
    stdout.write("Enter mark for subject $i: ");
    double mark = double.parse(stdin.readLineSync()!);   //user data inpute
    total += mark;   //Sum of All subject Marks
  }

  double percentage = (total / 500) * 100;   

  if (percentage > 75) {  //result print
    print("Distinction");
  } else if (percentage > 60 && percentage <= 75) {
    print("First class");
  } else if (percentage > 50 && percentage <= 60) {
    print("Second class");
  } else if (percentage > 35 && percentage <= 50) {
    print("Pass class");
  } else {
    print("Fail");
  }

  print("Total marks: $total");    //result print
  print("Percentage: ${percentage.toStringAsFixed(2)}%");
}