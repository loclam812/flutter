import 'package:flutter/material.dart';
import 'package:practice/models/todo_item.dart';

class TodoListItem extends StatelessWidget {
  const TodoListItem({
    Key? key,
    required this.data,
    required this.onRemove,
    required this.onTap,
  }) : super(key: key);

  final TodoItem data;
  final Function onRemove;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: GestureDetector(
        child: const Icon(Icons.remove),
        onTap: () {
          onRemove(data.uuid);
        },
      ),
      title: Text(data.text),
      trailing: Icon(
        data.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
      ),
      onTap: () {
        onTap(data);
      },
    );
  }
}
