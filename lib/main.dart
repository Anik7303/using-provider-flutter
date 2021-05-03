import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person {
  final String name;
  final int age;

  Person({this.name, this.age});
}

void main() {
  runApp(
    Provider(
      create: (_) => Person(name: 'Yohan', age: 25),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Class'),
      ),
      body: Center(
        child: Text(
          'Hi ${context.select((Person p) => p.name)}!\nYou are ${Provider.of<Person>(context).age} years old.',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
