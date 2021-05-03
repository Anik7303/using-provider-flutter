import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person with ChangeNotifier {
  final String name;
  int age;

  Person({this.name, this.age});

  void increaseAge() {
    int temp = age + 1;
    age = temp;
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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<Person, String>(
      selector: (BuildContext context, Person person) => person.name,
      builder: (context, String name, child) => Scaffold(
        appBar: AppBar(
          title: Text('$name -- ${Provider.of<Person>(context).age} years old'),
        ),
        body: child,
      ),
      child: Center(
        child: Text(
          'Howdy. Imagine there is s listview with hundreds of list tiles here. What an expensive widget!',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
