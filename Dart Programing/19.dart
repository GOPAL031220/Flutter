import 'dart:io';

void main(List<String> args) {
  print('Menu:');   //menu print
  print('1. Area of Triangle');
  print('2. Area of Rectangle');
  print('3. Area of Circle');
  print("Enter choice : ");
  int c = int.parse(stdin.readLineSync()!);   //user input

  if (c == 1) {  //result print as per choice
    print("Enter Base : ");
    int b = int.parse(stdin.readLineSync()!);
    print("Enter Height : ");
    int h = int.parse(stdin.readLineSync()!);
    print("Area of triangle ${(1 / 2) * b * h}");
  } else if (c == 2) {
    print("Enter length : ");
    int l = int.parse(stdin.readLineSync()!);
    print("Enter width : ");
    int w = int.parse(stdin.readLineSync()!);
    print("Area of Rectangle : ${l * w}");
  } else if (c == 3) {
    print("Enter radius : ");
    int r = int.parse(stdin.readLineSync()!);
    print("Area of circle is ${3.14 * r * r}");
  } else {
    print("Invalid Choice!");
  }
}