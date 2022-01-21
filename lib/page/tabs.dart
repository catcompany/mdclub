import 'package:flutter/material.dart';

import 'contact.dart';
import 'message.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  final List<Widget> widgets = [
    const MessagePage(),
    const ContactPage(),
  ];

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("讯息"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      drawer: const SettingsDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "消息",
            icon: Icon(Icons.message),
          ),
          BottomNavigationBarItem(
            label: "联系人",
            icon: Icon(Icons.contacts),
          ),
        ],
        currentIndex: _pageIndex,
        onTap: (v) {
          setState(() {
            _pageIndex = v;
          });
        },
      ),
      body: widget.widgets[_pageIndex],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

/// tabs 界面的侧边栏
class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removeViewPadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.only(
                top: 40,
                left: 6,
              ),
              child: Icon(
                Icons.ac_unit,
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
