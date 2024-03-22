import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/util/storage_utils.dart';

class ChangeNameController extends GetxController{
  late TextEditingController textEditingController;

  @override
  void onInit() {
    super.onInit();
    var name = StorageUtils.read<String>(StorageName.userName)??"Hello User";
    textEditingController=TextEditingController(text: name);
  }

  clickSure(Function() sureCall){
    var content = textEditingController.text.toString().trim();
    if(content.isEmpty){
      return;
    }
    Routers.offPage();
    StorageUtils.write(StorageName.userName, content);
    sureCall();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }
}