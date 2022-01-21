import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final List<String> _messageList = [];
  late ScrollController _scrollController;

  bool _showTopButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _showTopButton
          ? FloatingActionButton(
              child: const Icon(Icons.arrow_upward),
              onPressed: () {},
            )
          : null,
      body: Scrollbar(
        child: RefreshIndicator(
          onRefresh: _refreshMessageList,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Text("这是第$index条数据");
            },
            itemCount: _messageList.length,
            controller: _scrollController,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 221; i++) {
      _messageList.add("第$i条消息");
    }
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      debugPrint(_scrollController.offset.toString());
      if (_scrollController.offset > 48 && _showTopButton == false) {
        setState(() {
          _showTopButton = true;
        });
      } else if (_scrollController.offset <= 48 && _showTopButton == true) {
        setState(() {
          _showTopButton = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future _refreshMessageList() async {
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () {},
    );
  }
}
