import 'package:flutter/material.dart';
import 'package:instant_message/page/profile.dart';

import 'contact.dart';
import 'message.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);
  final List<Widget> widgets = [
    const MessagePage(),
    const ContactPage(),
    const ProfilePage()
  ];
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final List<String> tabs = ['消息', '联系人', '个人信息'];
  late final TabController _tabController;

  int _pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("讯息"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs
              .map((title) => Tab(
                    text: title,
                  ))
              .toList(),
        ),
      ),
      drawer: const SettingsDrawer(),
      body: TabBarView(
        children: widget.widgets,
        controller: _tabController,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        initialIndex: _pageIndex, length: tabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _pageIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
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
