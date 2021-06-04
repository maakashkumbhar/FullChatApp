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
      appBar: AppBar(title: Text("Personal Chats App"),centerTitle: true,actions: [
        IconButton(onPressed: (){
          controller.signOut();
          Get.to(Login());
        }, icon: Icon(Icons.logout))
      ],),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.grey , borderRadius: BorderRadius.circular(20)),
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Icon(Icons.search),
                    SizedBox(width: 10,),
                    Expanded(
                      child: TextField(decoration: InputDecoration(
                        hintText: "SearchUsers",
                        hintStyle: TextStyle(color: Colors.black, fontSize: 15)
                      ),),
                    ),
                  ],

                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 70,
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.85)),
              child: InkWell(
                onTap: (){
                  Get.to(()=>ChatScreen());
                },
                child: ListTile(
                  leading: CircleAvatar(backgroundImage: AssetImage('assets/background.jpg')),
                  title: Text("SomeOne Special"),
                  subtitle: Text("Last Msg Sent"),
                ),
              ),
              // child: Row(
              //   children: [
              //     CircleAvatar(backgroundImage: AssetImage('assets/background.jpg'),),
              //     SizedBox(width: 20,),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment:CrossAxisAlignment.start ,
              //       children: [
              //         Text("SomeOne Special"),
              //         SizedBox(height: 10,),
              //         Text("This is the Last Made Msg")
              //       ],
              //     )
              //   ],
              // ),
            ),
          )
          // Obx(() => Text("${controller.user}")),

        ],
      ),

    );
  }
}
