import 'dart:io';

void main() {
  print('Enter a number: ');
  String input = stdin.readLineSync()!;   //user data input and stored

  String reversed = input.split('').reversed.join('');

  print('The number in reverse order is: $reversed');    //result print
  
}