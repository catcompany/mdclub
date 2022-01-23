import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mdclub/page/tabs.dart';
import 'package:mdclub/utils/config.dart';
import 'package:mdclub/utils/device_utils.dart';
import 'package:mdclub/utils/httputils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String? _baseImage =
      "data:image/jpeg;base64,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";

  final GlobalKey<FormState> _key = GlobalKey();
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
              Center(child: _mainWrapper()),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _login(String account, String password) async {
    // if (account.isEmpty || password.isEmpty) {
    //   EasyLoading.showError("账号或密码为空");
    //   return;
    // }
    // var deviceName = await DeviceUtils().platformModel;
    // Map<String, String> loginInfo = {};
    // loginInfo['name'] = account;
    // loginInfo['password'] = sha1.convert(utf8.encode(password)).toString();
    // loginInfo['device'] = deviceName;

    // Response response =
    //     await dio.post(Config.login, data: jsonEncode(loginInfo));
    // debugPrint(response.data);
    // return;
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(builder: (context) => MainPage()),
    //   (route) => false,
    // );
  }

  Widget _mainWrapper() {
    if (_baseImage != null) {
      return _inputBoxWrapper();
    }
    Uint8List bytes = const Base64Decoder().convert(_baseImage!.split(',')[1]);
    Image.memory(bytes);
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: MemoryImage(bytes, scale: 0.5),
        ),
      ),
    );
  }

  Widget _inputBoxWrapper() {
    return Column(
      children: [
        Form(
          // key: _key,
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
                  var password = _password.text;
                  _login("account", "password");
                },
                child: const Text("登录"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
