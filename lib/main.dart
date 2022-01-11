import 'package:flutter/material.dart';
import 'package:instant_message/register.dart';

void main() {
  runApp(const MaterialApp(
    title: "讯息",
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  late String _account;
  late String _password;

  void login() {
    print("try to login");
  }

  // build 方法创建视图
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '讯息',
      theme: ThemeData(
        primaryColor: Colors.pink,
      ),
      home: Scaffold(
        body: (Container(
          alignment: Alignment.topCenter,
          // width: 256,
          // height: 256,
          margin: const EdgeInsets.only(left: 32, right: 32, top: 96),
          child: Column(
            children: [
              const Text(
                "欢迎使用",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 32,
                ),
              ),
              const TextField(
                maxLines: 1,
                maxLength: 12,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: "请输入账号",
                  labelText: "请输入账号",
                ),
              ),
              const TextField(
                maxLines: 1,
                maxLength: 16,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  icon: Icon(Icons.password),
                  hintText: "请输入密码",
                  labelText: "请输入密码",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 24, right: 4),
                    child: MaterialButton(
                      child: const Text(
                        "登录",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        login();
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 24, left: 4),
                    child: MaterialButton(
                      child: const Text(
                        "注册",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
