import 'package:quiznow/event/event_bus_util.dart';
import 'package:quiznow/util/ext.dart';
import 'package:quiznow/util/storage_utils.dart';

class TaskUtils{
  factory TaskUtils() => _getInstance();

  static TaskUtils get instance => _getInstance();

  static TaskUtils? _instance;

  static TaskUtils _getInstance() {
    _instance ??= TaskUtils._internal();
    return _instance!;
  }

  TaskUtils._internal(){
    _initTaskInfo();
  }

  //0go 1collect  2complete
  int scienceState=0,getCoin100State=0,answerRight30State=0,_todayMathCoinNum=0,_todayAnswerRightNum=0;

  _initTaskInfo(){
    try{
      //2022-02-02_0
      var str = StorageUtils.read<String>(StorageName.answerScienceQuestion)??"";
      if(str.contains(getTodayTimeStr())){
        scienceState=int.parse(str.split("_").last);
      }
    }catch(e){

    }
    try{
      //2022-02-02_0
      var str = StorageUtils.read<String>(StorageName.getCoin100Question)??"";
      if(str.contains(getTodayTimeStr())){
        getCoin100State=int.parse(str.split("_").last);
      }
    }catch(e){

    }
    try{
      //2022-02-02_0
      var str = StorageUtils.read<String>(StorageName.answerRight30Question)??"";
      if(str.contains(getTodayTimeStr())){
        answerRight30State=int.parse(str.split("_").last);
      }
    }catch(e){

    }
    try{
      //2022-02-02_0
      var str = StorageUtils.read<String>(StorageName.todayMathCoinNum)??"";
      if(str.contains(getTodayTimeStr())){
        _todayMathCoinNum=int.parse(str.split("_").last);
      }
    }catch(e){

    }
    try{
      //2022-02-02_0
      var str = StorageUtils.read<String>(StorageName.todayAnswerRightNum)??"";
      if(str.contains(getTodayTimeStr())){
        _todayAnswerRightNum=int.parse(str.split("_").last);
      }
    }catch(e){

    }
  }

  int updateAnswerState(type,answerResult,answerComplete){
    //science
    if(type==3&&answerComplete&&scienceState==0){
      scienceState=1;
      StorageUtils.write(StorageName.answerScienceQuestion, "${getTodayTimeStr()}_$scienceState");
      EventData(code: EventCode.updateHomeTaskList).send();
      return 0;
    }
    //math
    if(type==2&&getCoin100State==0){
      if(answerResult){
        _todayMathCoinNum+=10;
        StorageUtils.write(StorageName.todayMathCoinNum, "${getTodayTimeStr()}_$_todayMathCoinNum");
      }
      if(_todayMathCoinNum>=100){
        getCoin100State=1;
        StorageUtils.write(StorageName.getCoin100Question, "${getTodayTimeStr()}_$getCoin100State");
        EventData(code: EventCode.updateHomeTaskList).send();
        return 1;
      }
    }
    if(answerResult&&answerRight30State==0){
      _todayAnswerRightNum++;
      StorageUtils.write(StorageName.todayAnswerRightNum, "${getTodayTimeStr()}_$_todayAnswerRightNum");
      if(_todayAnswerRightNum>=30){
        answerRight30State=1;
        StorageUtils.write(StorageName.answerRight30Question, "${getTodayTimeStr()}_$answerRight30State");
        EventData(code: EventCode.updateHomeTaskList).send();
        return 2;
      }
    }
    return 3;
  }

  updateCompleteState(stateCall){
    switch(stateCall){
      case 0:
        scienceState=2;
        StorageUtils.write(StorageName.answerScienceQuestion, "${getTodayTimeStr()}_$scienceState");
        break;
      case 1:
        getCoin100State=2;
        StorageUtils.write(StorageName.getCoin100Question, "${getTodayTimeStr()}_$getCoin100State");
        break;
      case 2:
        answerRight30State=2;
        StorageUtils.write(StorageName.answerRight30Question, "${getTodayTimeStr()}_$answerRight30State");
        break;
    }
    EventData(code: EventCode.updateHomeTaskList).send();
  }
}