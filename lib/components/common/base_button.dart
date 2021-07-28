import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    this.labelText = 'Button',
    this.spacing = 6.0,
    this.isDisabled = false,
    this.isActive = false,
    this.isFullWidth = false,
    required this.onClick,
  }) : super(key: key);

  final String labelText;
  final double spacing;
  final bool isDisabled;
  final bool isActive;
  final bool isFullWidth;
  final Function onClick;

  handleClick() {
    if (isDisabled || isActive) {
      return null;
    }

    onClick();
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Container(
        padding: EdgeInsets.all(spacing),
        width: isFullWidth ? double.infinity : null,
        child: Center(
          child: Text(labelText),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          (isActive ? Colors.purple : Colors.blue)
              .withOpacity(isDisabled ? .5 : 1),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: handleClick,
    );
  }
}
