import 'dart:io';

void main(List<String> args) {
  for (int i = 1; i <= 5; i++) {
    for (int j = 1; j <= i; j++) {
      if ((i + j) % 2 == 0) {
        stdout.write("1");
      } else {
        stdout.write("0");
      }
    }
    print("");
  }
}