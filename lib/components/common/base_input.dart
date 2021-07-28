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
    return TextFormField(
      obscureText: type == 'password',
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      onChanged: (value) => onChanged(value),
    );
  }
}
