import 'package:flutter/material.dart';
import 'package:practice/components/todo/todo.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key}) : super(key: key);

  static const routeName = '/todo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Screen"),
      ),
      body: const SafeArea(
        child: Todo(),
      ),
    );
  }
}
