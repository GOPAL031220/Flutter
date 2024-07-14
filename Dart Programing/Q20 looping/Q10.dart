import 'dart:io';

void main(List<String> args) {
  print("Enter number : ");
  int n = int.parse(stdin.readLineSync()!);   //user data input and stored
  int last=0, first=0;
  last = n % 10;
  while (n > 0) {
    first = n;
    n = n ~/ 10;
  }
  
  int sum = first + last;
  print("Sum of last and first digit : $sum");  //result print
}