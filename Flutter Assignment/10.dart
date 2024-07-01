import 'dart:io';
void main() {
  print("Enter a number: ");
  int num = int.parse(stdin.readLineSync()!);   //user data input

  if (num > 0) {
    print("$num is a positive number.");
  } else if (num < 0) {
    print("$num is a negative number.");   //result print
  } else {
    print("$num is zero.");
  }
}