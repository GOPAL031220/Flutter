import 'dart:io';

void main() {
  while (true) {  //menu print
    print('Menu:');
    print('1. Addition');
    print('2. Subtraction');
    print('3. Multiplication');
    print('4. Division');
    print('5. Exit');
    print('Enter your choice: ');
    int choice = int.parse(stdin.readLineSync()!);  //user input

    if (choice == 5) {
      print('Exiting the program.');  //program close
      break;
    }

    print('Enter the first number: ');
    double num1 = double.parse(stdin.readLineSync()!);

    print('Enter the second number: ');
    double num2 = double.parse(stdin.readLineSync()!);

    switch (choice) {   //result print as per user choice
      case 1:
        print('Result: ${num1 + num2}');
        break;
      case 2:
        print('Result: ${num1 - num2}');
        break;
      case 3:
        print('Result: ${num1 * num2}');
        break;
      case 4:
        if (num2 != 0) {
          print('Result: ${num1 ~/ num2}');
        } else {
          print('Error: Division by zero is not allowed.');
        }
        break;
      default:
        print('Invalid choice! Please Enter a number between 1 to 5.');
    }
  }
}