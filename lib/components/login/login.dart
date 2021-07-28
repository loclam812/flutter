import 'package:flutter/material.dart';
// import 'package:practice/components/common/base_toggle_button.dart';
import 'package:practice/components/login/login_form.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 120.0,
                  ),
                ),
                // const BaseToggleButton(
                //   listData: [
                //     Text('Điện Thoại'),
                //     Text('Email'),
                //   ],
                // ),
                const LoginForm(),
              ],
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text('Hoặc'),
                Container(
                  constraints: const BoxConstraints(maxWidth: 220),
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 45.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/facebook.png",
                        width: 30.0,
                      ),
                      Image.asset(
                        "assets/images/google.png",
                        width: 30.0,
                      ),
                      Image.asset(
                        "assets/images/apple.png",
                        width: 30.0,
                      ),
                    ],
                  ),
                ),
                const Text('Bạn chưa có tài khoản? Đăng ký'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
