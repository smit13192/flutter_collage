import 'package:flutter/material.dart';
import 'package:ms/views/pages/login_page.dart';
import 'package:ms/views/pages/register_page.dart';

class LoginSupportPage extends StatefulWidget {
  const LoginSupportPage({super.key});

  @override
  State<LoginSupportPage> createState() => _LoginSupportPageState();
}

class _LoginSupportPageState extends State<LoginSupportPage> {
  bool isLogin = false;

  void onTap() {
    setState(() {
      if (isLogin) {
        isLogin = false;
      } else {
        isLogin = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return RegisterPage(onTap: onTap);
    } else {
      return LoginPage(onTap: onTap);
    }
  }
}
