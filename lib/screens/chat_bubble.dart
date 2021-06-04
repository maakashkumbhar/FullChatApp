import 'package:chatapp/model/getxMessageModel.dart';
import 'package:chatapp/model/message.dart';
import 'package:chatapp/service/flutterFire.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBubble extends GetWidget<FlutterFire> {
  var messagedata;

  ChatBubble(this.messagedata);
  @override
  Widget build(BuildContext context) {
    return messagedata['user'] == controller.userUID
        ? Container(
            margin: EdgeInsets.all(10),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Container(
                //     child: CircleAvatar(
                //   backgroundImage: AssetImage('assets/background.jpg'),
                // )),
                SizedBox(
                  width: 10,
                ),
                Container(
                    margin: EdgeInsets.all(5),
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.withOpacity(0.45)),
                    child: Center(
                        child: Text("${messagedata['Message']}")))
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.all(10),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    child: CircleAvatar(
                  backgroundImage: AssetImage('assets/background.jpg'),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                      margin: EdgeInsets.all(5),
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.withOpacity(0.45)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${messagedata['Message']}"),
                      ))),
                )
              ],
            ),
          );
  }
}
