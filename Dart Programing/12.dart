import 'dart:io';
void main(List<String> args) {
  print('Enter Number: ');
  int a=int.parse(stdin.readLineSync()!);     //user data input

  int count=0;
  for(int i=1; i<=a; i++)
  {
    if(a%i==0)      //check number is prime or not
    {
      count++;
    }
  }
  if(count==2) print('$a is a prime number');    //result print
  else print('$a is not a prime number');
}


