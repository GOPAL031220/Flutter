import 'dart:io';

void main(List<String> args) {
  int n = 1;
  for (int i = 1; i <= 5; i++) {
    for (int j = 1; j <= i; j++) {
      stdout.write("$n ");
      n++;
    }
    print("");
  }
}