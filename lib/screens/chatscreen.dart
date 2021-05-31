import 'package:chatapp/data.dart';
import 'package:chatapp/model/message.dart';
import 'package:chatapp/screens/chat_bubble.dart';
import 'package:chatapp/service/flutterFire.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends GetWidget<FlutterFire> {
  TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Chat App'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 150,
                child: ListView.builder(
                  reverse: true,
                  itemCount: Data().listOfMessage.length,
                  itemBuilder: (context, index) {
                    var data = Data().listOfMessage[index];
                    return ChatBubble(data);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.emoji_emotions),
                        color: Colors.grey,
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey),
                      width: MediaQuery.of(context).size.width - 140,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          decoration: InputDecoration(hintText: "Chat Here"),
                          controller: _messageController,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {
                          controller.addMessage(
                              message: _messageController.text,
                              messageat: DateTime.now(),
                              isme: true);
                          _messageController.clear();
                        },
                        icon: Icon(Icons.send),
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
