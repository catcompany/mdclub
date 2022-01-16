import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:instant_message/utils/global.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey _key = GlobalKey<FormState>();

  final TextEditingController _account = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final FocusNode _accountNode = FocusNode();
  final FocusNode _passwordNode = FocusNode();

  late Response response;
  var dio = Dio();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _account.dispose();
    _password.dispose();
    _accountNode.dispose();
    _passwordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("登录"),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                controller: _account,
                focusNode: _accountNode,
                autofocus: true,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  labelText: "账号",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "请输入账号";
                  }
                },
                onFieldSubmitted: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _password,
                focusNode: _passwordNode,
                decoration: const InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: "密码",
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "请输入密码";
                  }
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_account.text.isEmpty || _password.text.isEmpty) {
                    return;
                  }
                  var account = _account.text;
                  var password = _password.text;
                  var loginInfo = '''
                  {
                  "data": {
                    "attributes": {
                      "username": "$account",
                      "password": "$password"
                    }
                  }
                  ''';
                  response = await dio.post(
                    Global.login,
                    data: loginInfo,
                  );
                  debugPrint(response.toString());
                  if (response.data != null) {
                    return;
                  }
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const TestMainPage();
                      },
                      settings: const RouteSettings(
                        arguments: "iMorning",
                      ),
                      maintainState: false,
                      fullscreenDialog: false,
                    ),
                  );
                },
                child: const Text("登录"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestMainPage extends StatelessWidget {
  const TestMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic account = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("$account"),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        color: Colors.greenAccent[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '登陆成功！',
            ),
            ElevatedButton(
              child: const Text('返回前一个页面'),
              onPressed: () {
                //返回上一个页面
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
