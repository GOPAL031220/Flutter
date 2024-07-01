import 'dart:io';
void main(List<String> args) {

print('Enter Number 1: ');
int a= int.parse(stdin.readLineSync()!);

print('Enter Number 2: ');
int b= int.parse(stdin.readLineSync()!);   //user data input

print('Addition: ${a+b}');
print('Substraction: ${a-b}');
print('Multiplication: ${a*b}');  //result
print('Division: ${a/b}');

}