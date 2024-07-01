import 'dart:io';
void main() {
  print("Enter marks of 5 subjects: ");

  print("Hindi: ");
  double sub1 = double.parse(stdin.readLineSync()!);

  print("English: ");
  double sub2 = double.parse(stdin.readLineSync()!);

  print("Math: ");
  double sub3 = double.parse(stdin.readLineSync()!);

  print("Science: ");
  double sub4 = double.parse(stdin.readLineSync()!);

  print("Economics: ");
  double sub5 = double.parse(stdin.readLineSync()!);     //user data input

  double total = sub1 + sub2 + sub3 + sub4 + sub5;   //calculation
  double percentage = (total / 500) * 100;

  print("Total marks: $total");
  print("Percentage: $percentage%");  //result print
}