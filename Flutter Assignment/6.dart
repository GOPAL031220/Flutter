import 'dart:io';
void main(List<String> args) {

print('Enter Principal Amount: ');
int a= int.parse(stdin.readLineSync()!);

print('Enter interest rate: ');
int b= int.parse(stdin.readLineSync()!);   //user data input

print('Interest Amount: ${a*b/100}');  //result
}