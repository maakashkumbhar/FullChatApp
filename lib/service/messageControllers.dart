import 'package:chatapp/model/getxMessageModel.dart';
import 'package:chatapp/service/flutterFire.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  Rxn<List<MessageModel>> list_of_models = Rxn<List<MessageModel>>();

  List<MessageModel> get messages => list_of_models.value;
  final controller = Get.put(FlutterFire());

  @override
  void onInit() {
    Get.find<FlutterFire>().userUID;
    list_of_models.bindStream(controller.getUserChats());
  }
}
