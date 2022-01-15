import 'package:flutter/material.dart';
import 'package:instant_message/login.dart';
import 'package:instant_message/register.dart';

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // routes: {
      //   "/": (context) => const LoginPage(),
      //   "register": (context) => const RegisterPage(),
      //   "main": (context) => const TestMainPage(),
      // },
      title: "讯息",
      debugShowCheckedModeBanner: false,
    );
  }
}
