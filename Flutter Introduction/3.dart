import 'dart:io';
void main(List<String> args) {

print('Enter Number: ');
int a= int.parse(stdin.readLineSync()!);   //user data input

print('Square of $a: ${a*a}');
print('Cube of $a: ${a*a*a}');    //result

}