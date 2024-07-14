import 'dart:io';
void main(List<String> args) {
  print('Enter Year: ');
  int a= int.parse(stdin.readLineSync()!);   //user data input

  if(a%400==0) print('$a is a Leap Year');
  else if(a%100==0) print('$a is not a Leap Year');   //result print
  else if(a%4==0) print('$a is a Leap Year');
  else print('$a is not a Leap Year');

}