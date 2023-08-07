import 'dart:io';
import 'dart:core';

void modularExponentiation(String line) {
  int a = int.parse(line.split(' ')[0]);
  double b = double.parse(line.split(' ')[1]);
  int m = int.parse(line.split(' ')[2]);
  var res = binaryModExpo(a, b, m);
  print(res);
  String? lines = stdin.readLineSync();
  if (lines != null) modularExponentiation(lines);
}

int binaryModExpo(int a, double b, int m) {
  if (b == 0) return 1;
  if (b % 2 == 1) return (binaryModExpo(a, b - 1, m) * a) % m;
  var res = binaryModExpo(a, b / 2, m);
  return (res * res) % m;
}

void main() {
  stdin.readLineSync();
  String line = stdin.readLineSync()!;
  modularExponentiation(line);
}
