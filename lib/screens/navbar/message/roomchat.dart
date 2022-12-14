import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:hms_16/utils/constant.dart';

class RoomChatPage extends StatefulWidget {
  const RoomChatPage({super.key});

  @override
  State<RoomChatPage> createState() => _RoomChatPageState();
}

class _RoomChatPageState extends State<RoomChatPage> {
  bool isEmpty = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cPrimaryBase,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              maxRadius: 15,
              child: Icon(Icons.person),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "Nurul Zakiyah",
              style: TextStyle(color: cWhiteBase, fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: const [
          Icon(Icons.videocam),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.call),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Flexible(
              child: Column(
            children: [
              BubbleSpecialOne(
                text: 'Added iMassage shape bubbles',
                color: Color.fromRGBO(208, 224, 247, 1),
                textStyle: TextStyle(color: cBlack, fontSize: 16),
              ),
              BubbleSpecialOne(
                text: 'Please try and give some feedback on it!',
                color: Color.fromRGBO(208, 224, 247, 1),
                tail: false,
                textStyle: TextStyle(color: cBlack, fontSize: 16),
              ),
              BubbleSpecialOne(
                text: 'Sure',
                color: cWhiteDark,
                isSender: false,
              ),
              BubbleSpecialOne(
                text: "I tried. It's awesome!!!",
                color: cWhiteDark,
                tail: false,
                isSender: false,
              ),
              BubbleSpecialOne(
                text: "Thanks",
                color: cWhiteDark,
                tail: false,
                isSender: false,
              )
            ],
          )),
          Row(
            children: [
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          isEmpty = true;
                        } else if (value.isEmpty) {
                          isEmpty = false;
                        }
                      });
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: "Message",
                        prefixIcon: Icon(Icons.emoji_emotions),
                        suffixIcon:
                            Icon(isEmpty ? Icons.near_me : Icons.attachment),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: CircleAvatar(
                  backgroundColor: cPrimaryBase,
                  child: Icon(
                    Icons.mic,
                    color: cWhiteBase,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
