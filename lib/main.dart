// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mdclub/page/login.dart';
import 'package:mdclub/page/tabs.dart';

void main(List<String> args) {
  return runApp(
    MaterialApp(
      home: const LoginPage(),
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: true,
    ),
  );
}
