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
  int uuid = 0;
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
      todoList.add(TodoItem(uuid, false, inputValue));
      uuid++;
    });
  }

  void onPress(TodoItem data) {
    final uuid = data.uuid;
    var index = todoList.indexWhere((item) => item.uuid == uuid);

    setState(() {
      todoList[index].isCompleted = !data.isCompleted;
    });
  }

  void onRemove(uuid) {
    setState(() {
      todoList.removeWhere((item) => item.uuid == uuid);
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

  List<TodoItem> get todos {
    switch (currentStatus) {
      case 'todo':
        return todoList.where((item) => !item.isCompleted).toList();
      case 'done':
        return todoList.where((item) => item.isCompleted).toList();
      default:
        return todoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    final todoFilteredList = todos;

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
          if (todoList.isNotEmpty)
            TodoFilter(
              currentStatus: currentStatus,
              onChangeStatus: onChangeStatus,
            ),
        ],
      ),
    );
  }
}
