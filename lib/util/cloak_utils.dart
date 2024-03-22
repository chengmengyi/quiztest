import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:quiznow/http/http_manager.dart';
import 'package:quiznow/util/ext.dart';
import 'package:quiznow/util/storage_utils.dart';

class CloakUtils{
  factory CloakUtils() => _getInstance();

  static CloakUtils get instance => _getInstance();

  static CloakUtils? _instance;

  static CloakUtils _getInstance() {
    _instance ??= CloakUtils._internal();
    return _instance!;
  }

  CloakUtils._internal();

  var _requestNum=0;

  requestCloak()async{
    var cloakStr = StorageUtils.read<String>(StorageName.cloakStr)??"";
    if(_requestNum>=20||cloakStr.isNotEmpty){
      return;
    }
    var distinctId = await FlutterTbaInfo.instance.getDistinctId();
    var deviceModel = await FlutterTbaInfo.instance.getDeviceModel();
    var bundleId = await FlutterTbaInfo.instance.getBundleId();
    var osVersion = await FlutterTbaInfo.instance.getOsVersion();
    var gaid = await FlutterTbaInfo.instance.getGaid();
    var androidId = await FlutterTbaInfo.instance.getAndroidId();
    var appVersion = await FlutterTbaInfo.instance.getAppVersion();
    var url="$cloakUrl?banana=$distinctId&clarity=${DateTime.now().millisecondsSinceEpoch}&porphyry=$deviceModel&habitual=$bundleId&bunch=$osVersion&wayside=$gaid&arm=$androidId&ibex=atone&splash=$appVersion";
    var s = await HttpManager.instance.requestCloak(url: url);
    if(s.isNotEmpty&&(s=="kimball"||s=="miss")){
      StorageUtils.write(StorageName.cloakStr, s);
    }else{
      _requestNum++;
      requestCloak();
    }
  }
}