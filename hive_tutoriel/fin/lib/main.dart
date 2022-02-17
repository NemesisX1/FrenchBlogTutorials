import 'package:flutter/material.dart';
import 'package:hive_tutoriel/pages/home_page.dart';
import 'package:hive_tutoriel/pages/login_page.dart';

void main() {
  runApp(const App());
}

// Notre application
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tutoriel Hive',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
