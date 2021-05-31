import 'package:chatapp/screens/chatscreen.dart';
import 'package:chatapp/screens/login.dart';
import 'package:chatapp/service/flutterFire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends GetWidget<FlutterFire> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: MaterialButton(
              onPressed: () {
                Get.to(ChatScreen());
              },
              child: Row(
                children: [
                  Icon(Icons.arrow_forward_ios_rounded),
                  Text("Chat Section")
                ],
              ),
            ),
          ),
          Obx(() => Text("${controller.user}")),
          SizedBox(
            height: 30,
          ),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.black),
              child: MaterialButton(
                onPressed: () {
                  controller.signOut();
                  Get.to(Login());
                },
                child: Text(
                  'SignOut',
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
