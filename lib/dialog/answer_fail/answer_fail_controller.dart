import 'package:get/get.dart';
import 'package:quiznow/routers/routers.dart';

class AnswerFailController extends GetxController{

  click(Function(bool p1) call,next){
    Routers.offPage();
    call(next);
  }
}
