import 'package:chatapp/service/flutterFire.dart';
import 'package:get/get.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FlutterFire>(() => FlutterFire());
  }
}
