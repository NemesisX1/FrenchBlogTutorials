import 'package:flutter/material.dart';
import 'package:hive_tutoriel/models/app_user.dart';
import 'package:hive_tutoriel/pages/login_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AppUserAdapter());
  await Hive.openBox<AppUser>("user");

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
      home: const LoginPage(),
    );
  }
}
