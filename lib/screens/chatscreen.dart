import 'package:chatapp/data.dart';
import 'package:chatapp/model/message.dart';
import 'package:chatapp/screens/chat_bubble.dart';
import 'package:chatapp/service/flutterFire.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var chats;

  TextEditingController _messageController = TextEditingController();

  final controller = Get.put(FlutterFire());

  @override
  void initState() {
    setState(() {
      chats = controller.getUserChats();
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Chat App'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder(stream: FirebaseFirestore.instance.collection("Messages").orderBy("TimeStamp",descending: true).snapshots(),builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData)
              { return Text("No Data");}
            return ListView.builder(itemCount: snapshot.data.docs.length,itemBuilder: (context,index){
              DocumentSnapshot snaps = snapshot.data.docs[index];
              return ChatBubble(snaps);
            },);
          }),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      controller.addMessage(
                          message: _messageController.text,
                          messageat: DateTime.now(),
                          isme: true);
                      _messageController.clear();
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
