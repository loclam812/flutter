import 'package:flutter/material.dart';

import 'package:practice/components/common/base_button.dart';

class TodoFilter extends StatelessWidget {
  const TodoFilter({
    Key? key,
    required this.currentStatus,
    required this.onChangeStatus,
  }) : super(key: key);

  final String currentStatus;
  final Function onChangeStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BaseButton(
          labelText: 'All',
          isActive: currentStatus == 'all',
          onClick: () => onChangeStatus('all'),
        ),
        const Padding(padding: EdgeInsets.only(left: 20.0)),
        BaseButton(
          labelText: 'Todo',
          isActive: currentStatus == 'todo',
          onClick: () => onChangeStatus('todo'),
        ),
        const Padding(padding: EdgeInsets.only(left: 20.0)),
        BaseButton(
          labelText: 'Done',
          isActive: currentStatus == 'done',
          onClick: () => onChangeStatus('done'),
        ),
      ],
    );
  }
}
