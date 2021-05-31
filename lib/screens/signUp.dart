import 'package:chatapp/screens/login.dart';
import 'package:chatapp/service/flutterFire.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends GetWidget<FlutterFire> {
  TextEditingController _emailEdittingController = TextEditingController();
  TextEditingController _passwordEdittingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "SignUp",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 80,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.grey),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Email",
              ),
              controller: _emailEdittingController,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 80,
            margin: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.grey),
            child: TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
              controller: _passwordEdittingController,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black),
            child: MaterialButton(
              onPressed: () {
                var result = controller.signUp(_emailEdittingController.text,
                    _passwordEdittingController.text);
                Get.to(Login());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.login,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'SignUp',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
