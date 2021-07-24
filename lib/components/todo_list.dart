import 'package:flutter/material.dart';
import 'package:practice/models/todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.listData,
    required this.onTap,
    required this.onRemove,
  }) : super(key: key);

  final List<TodoItem> listData;
  final Function onTap;
  final Function onRemove;

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
    if (listData.isEmpty) {
      return const Center(
        child: Text('No items'),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: listData.length,
      itemBuilder: (BuildContext context, int i) {
        return _buildRow(listData[i], i);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
