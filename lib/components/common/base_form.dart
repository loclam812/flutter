import 'package:flutter/material.dart';
import 'package:practice/components/common/base_button.dart';
import 'package:practice/components/common/base_input.dart';

class BaseForm extends StatefulWidget {
  const BaseForm({Key? key}) : super(key: key);

  @override
  _BaseForm createState() => _BaseForm();
}

class _BaseForm extends State<BaseForm> {
  final _formKey = GlobalKey<FormState>();

  void onChanged(value, name) {
    // ignore: avoid_print
    print('value $value');
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pending')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          BaseInput(
            labelText: 'Email *',
            onChanged: (value) {
              onChanged(value, 'email');
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25.0),
          ),
          BaseInput(
            type: 'password',
            labelText: 'Mật Khẩu *',
            onChanged: (value) {
              onChanged(value, 'password');
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text('Quên Mật Khẩu?'),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
          BaseButton(
            labelText: 'Đăng Nhập',
            spacing: 10.0,
            isFullWidth: true,
            onClick: onSubmit,
          ),
          // Add TextFormFields and ElevatedButton here.
        ],
      ),
    );
  }
}
