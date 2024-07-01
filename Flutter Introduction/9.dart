import 'dart:io';
void main() {
  print("Enter first number: ");
  int a = int.parse(stdin.readLineSync()!);

  print("Enter second number: ");
  int b = int.parse(stdin.readLineSync()!);  //user data input

  print("Before swap: a = $a, b = $b");

  // Swap without using a third variable
  a = a + b;
  b = a - b;
  a = a - b;

  print("After swap: a = $a, b = $b");  //print after swap
}