import 'dart:io';

void main(List<String> args) {
  int fac = 1;
  print("Enter number : ");
  int n = int.parse(stdin.readLineSync()!);    //user data input and stored
  for (int i = 1; i <= n; i++) {
    fac *= i;
  }
  print("Factorial is $fac");  //result print
}