// Uses dart 2.9 (non null-safety)
// https://www.beecrowd.com.br/repository/UOJ_1225_en.html

import 'dart:io';
import 'dart:convert';

void main(){
  int count;

  while (true){
     count = int.tryParse(stdin.readLineSync(encoding: utf8) ?? '');
     if(count == null || count < 1) return;
     askForNotes(count);
  }
}

void askForNotes(int count) {
  final notes = stdin.readLineSync(encoding: utf8)?.split(' ').map(int.parse);

  if (notes == null) return;
  if (notes.length != count) return;

  print(_perfectChoir(count, notes));
}

int _perfectChoir(int count, Iterable<int> notes) {
  final sum = notes.fold(0, (a,b) => a+b);
  if (sum % count != 0) return -1;

  final target = sum ~/ count; 
  final maiores = notes.where((it) => it > target);
  final sumMaiores = maiores.fold<int>(1, (acc, elem) => acc + (elem - target));

  return sumMaiores;
}
