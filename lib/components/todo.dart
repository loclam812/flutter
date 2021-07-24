// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';

import 'package:practice/models/todo_item.dart';
import 'package:practice/components/todo_action.dart';
import 'package:practice/components/todo_list.dart';
import 'package:practice/components/todo_filter.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _Todo createState() => _Todo();
}

class _Todo extends State<Todo> {
  int index = 0;
  String inputValue = '';
  String currentStatus = 'all';
  List<TodoItem> todoList = [];

  void onChanged(value) {
    setState(() {
      inputValue = value;
    });
  }

  void onAdd() {
    setState(() {
      todoList.add(TodoItem(index, false, inputValue));
      index++;
    });
  }

  void onPress(isCompleted, index) {
    setState(() {
      todoList[index].isCompleted = !isCompleted;
    });
  }

  void onRemove(index) {
    setState(() {
      todoList.removeWhere((item) => item.index == index);
    });
  }

  void onChangeStatus(status) {
    if (currentStatus == status) {
      return;
    }

    setState(() {
      currentStatus = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TodoItem> todoFilteredList = [];

    switch (currentStatus) {
      case 'todo':
        todoFilteredList = todoList.where((item) => !item.isCompleted).toList();
        break;
      case 'done':
        todoFilteredList = todoList.where((item) => item.isCompleted).toList();
        break;
      default:
        todoFilteredList = todoList;
        break;
    }

    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          TodoAction(
            inputValue: inputValue,
            onChanged: onChanged,
            onAdd: onAdd,
          ),
          Expanded(
            child: TodoList(
              listData: todoFilteredList,
              onTap: onPress,
              onRemove: onRemove,
            ),
          ),
          if (todoFilteredList.isNotEmpty)
            TodoFilter(
              currentStatus: currentStatus,
              onChangeStatus: onChangeStatus,
            ),
        ],
      ),
    );
  }
}
