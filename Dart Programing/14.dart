import 'dart:io';
void main(List<String> args) {
  
  print('Enter Number 1: ');
  int a=int.parse(stdin.readLineSync()!);

  print('Enter Number 2: ');
  int b=int.parse(stdin.readLineSync()!);

  print('Enter Number 3: ');
  int c=int.parse(stdin.readLineSync()!);    //user data input

  (a>b && a>c)? print('$a is a Max Number'): (b>a && b>c)? print('$b is a Max Number'): print('$c is a Max Number');
}