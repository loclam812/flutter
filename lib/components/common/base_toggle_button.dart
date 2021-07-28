import 'package:flutter/material.dart';

class BaseToggleButton extends StatefulWidget {
  const BaseToggleButton({
    Key? key,
    required this.listData,
  }) : super(key: key);

  final List<Widget> listData;

  @override
  _BaseToggleButton createState() => _BaseToggleButton();
}

class _BaseToggleButton extends State<BaseToggleButton> {
  late List<bool> _selections;

  @override
  void initState() {
    _selections = List.generate(widget.listData.length, (_) => false);
    super.initState();
  }

  _buildData() {
    return Row(
      children: widget.listData.map<Widget>((v) {
        return v;
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(color: Colors.white10),
      child: ToggleButtons(
        children: _buildData(),
        isSelected: _selections,
        fillColor: Colors.white,
        hoverColor: Colors.white,
        onPressed: (int index) {
          setState(() {
            for (var i = 0; i <= _selections.length; i++) {
              if (i == index) {
                _selections[i] == !_selections[i];
              } else {
                _selections[i] = false;
              }
            }
          });
        },
      ),
    );
  }
}
