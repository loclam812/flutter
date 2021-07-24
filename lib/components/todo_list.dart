import 'package:flutter/material.dart';
import 'package:practice/models/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.currentStatus,
    required this.listData,
    required this.onTap,
    required this.onRemove,
  }) : super(key: key);

  final String currentStatus;
  final List<TodoItem> listData;
  final Function onTap;
  final Function onRemove;

  listRender() {
    var listRender = [];

    switch (currentStatus) {
      case 'todo':
        listRender = listData.where((item) => !item.isCompleted).toList();
        break;
      case 'done':
        listRender = listData.where((item) => item.isCompleted).toList();
        break;
      default:
        listRender = listData;
        break;
    }

    return listRender;
  }

  Widget _buildRow(item, index) {
    return ListTile(
      leading: GestureDetector(
        child: const Icon(Icons.remove),
        onTap: () => onRemove(item.index),
      ),
      title: Text(item.text),
      trailing: Icon(
        item.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
      ),
      onTap: () => onTap(item.isCompleted, index),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (listRender().isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('No items'),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: listRender().length,
      itemBuilder: (BuildContext context, int i) {
        return _buildRow(listRender()[i], i);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}