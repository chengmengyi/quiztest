 import 'package:get/get.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/util/user_info_utils.dart';

class AnswerRightController extends GetxController{

  click(Function() call){
    UserInfoUtil.instance.updateCoinNum(10);
    Routers.offPage();
    call();
  }
}