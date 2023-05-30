import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../messages_pages/new_message_page.dart';
import '../messages_pages/no_messages_page.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NoMessagesPage());

  }
}




