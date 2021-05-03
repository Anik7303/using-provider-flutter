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
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Person>(
      builder: (context, person, child) => Scaffold(
        appBar: AppBar(
          title: Text('${person.name} -- ${person.age} years old'),
        ),
        body: child,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => person.increaseAge(),
        ),
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
