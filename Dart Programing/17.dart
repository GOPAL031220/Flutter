import 'dart:io';

void main() {
  print('Enter a number (1-7): ');
  int a = int.parse(stdin.readLineSync()!);   //user data input

  switch (a) {  //result Print as per choice
    case 1:
      print('Monday');
      break;
    case 2:
      print('Tuesday');
      break;
    case 3:
      print('Wednesday');
      break;
    case 4:
      print('Thursday');
      break;
    case 5:
      print('Friday');
      break;
    case 6:
      print('Saturday');
      break;
    case 7:
      print('Sunday');
      break;
    default:
      print('Invalid input! Please Enter a number between 1 to 7.');
  }
}