import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mdclub/page/tabs.dart';
import 'package:mdclub/utils/device_utils.dart';
import 'package:mdclub/utils/httputils.dart';

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
  var dio = HttpUtils().getDio();

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
                  var account = _account.text;
                  var password = _password.text;
                  _login(account, password);
                },
                child: const Text("登录"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(String account, String password) async {
    if (account.isEmpty || password.isEmpty) {
      EasyLoading.showError("账号或密码为空");
      return;
    }
    Map loginInfo = {};
    loginInfo['name'] = account;
    loginInfo['password'] = password;

    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    final map = deviceInfo.toMap();
    map.forEach((key, value) => debugPrint("$key : $value"));

    debugPrint(await DeviceUtils().platformModel);
    return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
      (route) => false,
    );
  }
}
