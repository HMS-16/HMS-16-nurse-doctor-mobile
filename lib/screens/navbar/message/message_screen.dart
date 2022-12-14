import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';

class MessageScreen extends StatefulWidget {
  final List text;
  const MessageScreen({super.key, required this.text});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Container(
        child: BubbleSpecialOne(
          text: widget.text[index]['message'].text.text[0],
          isSender: widget.text[index]['isUserMessage'] ? true : false,
          color: widget.text[index]['isUserMessage']
              ? Color.fromRGBO(208, 224, 247, 1)
              : cWhiteDark,
          textStyle: TextStyle(color: cBlack, fontSize: 16),
        ),
      ),
      separatorBuilder: (context, index) =>
          Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.text.length,
    );
  }
}
