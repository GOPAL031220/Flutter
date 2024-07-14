import 'dart:io';

void main(List<String> args) {
  int a1 = 0, a2 = 1, a3;
  print("Enter number : ");
  int n = int.parse(stdin.readLineSync()!);   //user data input and stored
  print("$a1");
  print("$a2");
  for (int i = 3; i <= n; i++) {
    a3 = a1 + a2;
    a1 = a2;
    a2 = a3;
    print("$a3");   //result print
  }
}