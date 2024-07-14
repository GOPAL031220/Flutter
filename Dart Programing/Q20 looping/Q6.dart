import 'dart:io';

void main(List<String> args) {
  print("Enter the number : ");
  int n = int.parse(stdin.readLineSync()!);   //user data input and stored
  for (int i = 1; i <= 10; i++) {
    print("$n * $i = ${n * i}");    //result print
  }
}