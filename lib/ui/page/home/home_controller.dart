import 'dart:async';
import 'dart:math';
import 'package:get/get.dart';
import 'package:quiznow/dialog/change_name/change_name_dialog.dart';
import 'package:quiznow/dialog/get_coin/get_coin_dialog.dart';
import 'package:quiznow/event/event_bus_util.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/util/task_utils.dart';

class HomeController extends GetxController{
  late StreamSubscription<EventData>? bus;
  List<String> categoryList=["home9","home10","home11","home12","home13"];

  @override
  void onInit() {
    super.onInit();
    bus=EventBusUtil.getInstance()?.on<EventData>().listen((data) {
      if(data.code==EventCode.updateHomeTaskList){
        update(["task"]);
      }
    });
  }

  getTaskBtnRes(int state){
    if(state==0){
      return "home16";
    }else if(state==1){
      return "home17";
    }else{
      return "home20";
    }
  }

  clickTaskBtn(index,state){
    if(state==0){
      if(index==0){
        Routers.toPageByName(routerName: Routers.answer,params: {"index":3});
      }else if(index==1){
        Routers.toPageByName(routerName: Routers.answer,params: {"index":2});
      }else{
        Routers.toPageByName(routerName: Routers.answer,params: {"index":Random().nextInt(5)});
      }
    }else if(state==1){
      Routers.showDialog(
        child: GetCoinDialog(
          coinNum: 50,
          call: (){
            TaskUtils.instance.updateCompleteState(index);
          },
        )
      );
    }
  }

  showChangeNameDialog(){
    Routers.showDialog(
      child: ChangeNameDialog(
        sureCall: (){
          update(["name"]);
        },
      )
    );
  }

  @override
  void onClose() {
    super.onClose();
    bus?.cancel();
    bus=null;
  }
}