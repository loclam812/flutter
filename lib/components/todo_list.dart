import 'package:flutter/material.dart';
import 'package:practice/components/todo_list_item.dart';
import 'package:practice/models/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.listData,
    required this.onTap,
    required this.onRemove,
  }) : super(key: key);

  final List<TodoItem> listData;
  final void Function(TodoItem) onTap;
  final Function onRemove;

  @override
  Widget build(BuildContext context) {
    if (listData.isEmpty) {
      return const Center(
        child: Text('No items'),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: listData.length,
      itemBuilder: (BuildContext context, int index) {
        var data = listData[index];

        return TodoListItem(
          key: ValueKey('todo-item-${data.uuid}'),
          data: data,
          onRemove: onRemove,
          onTap: onTap,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
