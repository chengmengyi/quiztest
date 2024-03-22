import 'package:quiznow/event/event_bus_util.dart';
import 'package:quiznow/util/ext.dart';
import 'package:quiznow/util/storage_utils.dart';

class UserInfoUtil{
  factory UserInfoUtil() => _getInstance();

  static UserInfoUtil get instance => _getInstance();

  static UserInfoUtil? _instance;

  static UserInfoUtil _getInstance() {
    _instance ??= UserInfoUtil._internal();
    return _instance!;
  }

  UserInfoUtil._internal(){
    coinNum=StorageUtils.read<int>(StorageName.coinNum)??0;
    var str = StorageUtils.read<String>(StorageName.heartNum)??"";
    try{
      if(str.contains(getTodayTimeStr())){
        heartNum=int.parse(str.split("_").last);
      }
    }catch(e){}
  }

  var heartNum=5;
  var coinNum=0;

  reduceHeartNum(){
    heartNum--;
    StorageUtils.write(StorageName.heartNum, "${getTodayTimeStr()}_$heartNum");
    EventData(code: EventCode.updateHeartNum).send();
  }

  updateCoinNum(int addNum){
    coinNum+=addNum;
    StorageUtils.write(StorageName.coinNum, coinNum);
    EventData(code: EventCode.updateCoinNum).send();
  }
}