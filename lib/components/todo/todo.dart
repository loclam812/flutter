import 'package:flutter/material.dart';

import 'package:practice/models/todo_item.dart';
import 'package:practice/components/common/base_input.dart';
import 'package:practice/components/todo/todo_action.dart';
import 'package:practice/components/todo/todo_list.dart';
import 'package:practice/components/todo/todo_filter.dart';

class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  _Todo createState() => _Todo();
}

class _Todo extends State<Todo> {
  int uuid = 0;
  String inputValue = '';
  String searchValue = '';
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

  void onSearch(value) {
    setState(() {
      searchValue = value.trim();
    });
  }

  List<TodoItem> get todos {
    var isEmptySearchValue = searchValue.isEmpty;

    filterSearch(text) {
      return isEmptySearchValue || text.contains(searchValue);
    }

    switch (currentStatus) {
      case 'todo':
        return todoList.where((item) {
          return !item.isCompleted && filterSearch(item.text);
        }).toList();
      case 'done':
        return todoList.where((item) {
          return item.isCompleted && filterSearch(item.text);
        }).toList();
      default:
        return todoList.where((item) {
          return filterSearch(item.text);
        }).toList();
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
          if (todoList.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: BaseInput(
                labelText: 'Search',
                onChanged: onSearch,
              ),
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
