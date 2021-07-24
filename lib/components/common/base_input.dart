import 'package:flutter/material.dart';

class BaseInput extends StatelessWidget {
  const BaseInput({
    Key? key,
    this.type = 'text',
    this.labelText = 'Enter',
    required this.onChanged,
  }) : super(key: key);

  final String type;
  final String labelText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: type == 'password',
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      onChanged: (value) => onChanged(value),
    );
  }
}
