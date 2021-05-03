import 'package:flutter/material.dart';

class Person with ChangeNotifier {
  final String name;
  int age;

  Person({this.name, this.age});

  void increaseAge() {
    age++;
    notifyListeners();
  }
}

void main() {
  Person person = Person(name: 'Yohan', age: 25);

  // 'addListener' is a method on the 'ChangeNotifier' class,
  // which is mixed-in to the Person class
  person.addListener(() {
    print('value updated: ${person.age}');
  });

  person.increaseAge();
}
