import 'package:chatapp/service/flutterFire.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/login.dart';

class IsSignedIn extends GetWidget<FlutterFire> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<FlutterFire>().user != null) ? Home() : Login();
    });
  }
}
