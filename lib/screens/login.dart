import 'package:chatapp/screens/home.dart';
import 'package:chatapp/screens/signUp.dart';
import 'package:chatapp/service/flutterFire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Login extends GetWidget<FlutterFire> {
  TextEditingController _emailEddittingCont = TextEditingController();
  TextEditingController _passwordEddittingCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20),
            child: Text(
              "Login",
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
              decoration: InputDecoration(labelText: "Email"),
              controller: _emailEddittingCont,
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
              controller: _passwordEddittingCont,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black),
            child: MaterialButton(
              onPressed: () {
                var res = controller.signIn(
                    _emailEddittingCont.text, _passwordEddittingCont.text);
                if(res == true) {
                  Get.to(Home());
                }
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
                    'Sign',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.black),
            child: MaterialButton(
              onPressed: () {
                Get.to(SignUp());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.app_registration_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text("New User ? Register Here",
                      style: TextStyle(fontSize: 15, color: Colors.white))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
