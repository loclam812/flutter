import 'package:flutter/material.dart';

import 'package:practice/screens/todo.dart';
import 'package:practice/screens/login.dart';
import 'package:practice/screens/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => const LoginScreen(),
        SecondScreen.routeName: (context) => const SecondScreen(),
        TodoScreen.routeName: (context) => const TodoScreen(),
      },
    );
  }
}
