 import 'package:get/get.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/util/task_utils.dart';
import 'package:quiznow/util/user_info_utils.dart';

class GetCoinController extends GetxController{

  click(coinNum,Function() call){
    UserInfoUtil.instance.updateCoinNum(coinNum);
    Routers.offPage();
    call();
  }
}