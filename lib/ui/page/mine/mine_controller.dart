import 'package:get/get.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/util/ext.dart';
import 'package:url_launcher/url_launcher.dart';

class MineController extends GetxController{
  clickItem(index){
    switch(index){
      case 0:
        Routers.toPageByName(routerName: Routers.web,params: {"title":"Privacy Policy","url":privacyStr});
        break;
      case 1:
        Routers.toPageByName(routerName: Routers.web,params: {"title":"Term of User","url":termOfUser});
        break;
      case 2:
        launch("mailto:$email");
        break;
    }
  }
}