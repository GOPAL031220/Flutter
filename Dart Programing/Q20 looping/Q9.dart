import 'dart:io';

void main(List<String> args) {
  print("Enter number : ");
  int n = int.parse(stdin.readLineSync()!);   //user data input and stored
  int sum = 0;
  while (n > 0) {
    int i = n % 10;
    sum += i;
    n = n ~/ 10;
  }
  print("Sum : $sum");   //result print
}