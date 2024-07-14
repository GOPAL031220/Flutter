import 'dart:io';
void main(List<String> args) {
  
  print('Enter Number 1: ');
  int a=int.parse(stdin.readLineSync()!);

  print('Enter Number 2: ');
  int b=int.parse(stdin.readLineSync()!);

  print('Enter Number 3: ');
  int c=int.parse(stdin.readLineSync()!);    //user data input

  if(a>b)
  {
    if(a>c) print('$a is a Max Number');  //result print
    else print('$c is a Max Number');
  }
  if(b>c)
  {
    if(b>a) print('$b is a Max Number');
    else print('$a is Max number');
  }
  if(c>a)
  {
    if(c>b) print('$c is a Max Number');
    else print('$b is a Max Number');
  }
}