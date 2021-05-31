import 'package:chatapp/bindings/flutterfireBindings.dart';
import 'package:chatapp/isSignedIn.dart';
import 'package:chatapp/service/flutterFire.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/home.dart';
import 'screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String uid;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: InstanceBinding(),
        // ignore: unnecessary_null_comparison
        home: IsSignedIn());
  }
}
