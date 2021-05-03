import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  runApp(
    ChangeNotifierProvider(
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
          'Hi ${Provider.of<Person>(context).name}!\nYou are ${Provider.of<Person>(context).age} years old.',
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30.0,
        ),
        onPressed: () =>
            Provider.of<Person>(context, listen: false).increaseAge(),
      ),
    );
  }
}
