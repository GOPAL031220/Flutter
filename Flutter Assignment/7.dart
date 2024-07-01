import 'dart:io';
void main() {
  print("Enter temperature in degree centigrade: ");
  double celsius = double.parse(stdin.readLineSync()!);  //user data input

  double fahrenheit = (celsius * 9/5) + 32;   //formula for convertion

  print("$celsius degree centigrade is equal to $fahrenheit degree Fahrenheit");  //result print
}