import 'dart:io';

void main(List<String> args) {
  print("Enter number : ");
  int n = int.parse(stdin.readLineSync()!);   //user data input and stored
  int max = 0;
  while (n > 0) {
    int digit = n % 10;
    if (digit > max) {
      max = digit;
    }
    n = n~/10;
  }
  print("Max number is $max");  //result print
}