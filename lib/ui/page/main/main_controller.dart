import 'dart:async';

import 'package:get/get.dart';
import 'package:quiznow/routers/routers.dart';

class MainController extends GetxController{
  @override
  void onReady() {
    super.onReady();
    Timer.periodic(const Duration(milliseconds: 2000), (timer) {
      timer.cancel();
      Routers.toPageOffLastName(router: Routers.home);
    });
  }
}