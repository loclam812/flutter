import 'package:flutter/material.dart';

import 'package:practice/components/common/base_input.dart';
import 'package:practice/components/common/base_button.dart';

class TodoAction extends StatelessWidget {
  const TodoAction({
    Key? key,
    this.inputValue = '',
    required this.onChanged,
    required this.onAdd,
  }) : super(key: key);

  final String inputValue;
  final Function onChanged;
  final Function onAdd;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: BaseInput(
            labelText: 'Please Press',
            onChanged: onChanged,
          ),
          flex: 3,
        ),
        const Padding(padding: EdgeInsets.only(left: 20.0)),
        Expanded(
          child: BaseButton(
            labelText: 'Add',
            spacing: 12.0,
            isDisabled: inputValue.isEmpty,
            onClick: onAdd,
          ),
        ),
      ],
    );
  }
}
