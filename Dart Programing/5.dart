import 'dart:io';
void main(List<String> args) {

print('Enter Base of Triangle: ');
int a= int.parse(stdin.readLineSync()!);

print('Enter Height of Triangle: ');
int b= int.parse(stdin.readLineSync()!);   //user data input

print('Area of Triangle: ${0.5*a*b}');  //result
}