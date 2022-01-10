import 'package:flutter/material.dart';
import 'package:instant_message/login.dart';

void main() {
  runApp(const MaterialApp(
    title: "MainApp",
    home: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  // build 方法创建视图
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '讯息',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        body: (Container(
          alignment: Alignment.topCenter,
          // width: 256,
          // height: 256,
          margin: const EdgeInsets.only(left: 32, right: 32, top: 72),
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
                maxLength: 16,
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
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      onPressed: () {},
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
                                builder: (context) => const LoginPage()));
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
