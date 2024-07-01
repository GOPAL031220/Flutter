import 'dart:io';
void main(List<String> args) {

print('Enter Radius of Circle: ');
int a= int.parse(stdin.readLineSync()!);   //user data input
double b=3.14;

print('Area of Circle: ${b*a*a}');      //result

}