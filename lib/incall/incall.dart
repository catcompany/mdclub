import 'package:flutter/material.dart';

class InCallPage extends StatefulWidget {
  const InCallPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _InCallPage();
  }
}

class _InCallPage extends State<InCallPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "通话",
      home: Scaffold(
        body: Text("测试"),
      ),
    );
  }
}
