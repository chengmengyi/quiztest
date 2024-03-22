import 'package:dio/dio.dart';
import 'package:quiznow/http/http_method.dart';

class HttpManager{
  factory HttpManager() => _getInstance();
  static HttpManager get instance => _getInstance();
  static HttpManager? _instance;
  static HttpManager _getInstance() {
    _instance ??= HttpManager._internal();
    return _instance!;
  }
  HttpManager._internal(){
    if (_dio == null) {
      BaseOptions options = BaseOptions(
          responseType: ResponseType.json,
          receiveDataWhenStatusError: false,
          connectTimeout: const Duration(milliseconds: 30000),
          receiveTimeout: const Duration(milliseconds: 30000),
      );
      _dio = Dio(options);
    }
  }

  Dio? _dio;
  String ip="";

  Future<String> requestCloak({required String url}) async{
    try{
      var response = await _dio?.request<String>(
          url,
          options: Options(method: HttpMethod.get)
      );
      if(response?.statusCode==200){
        return response?.data?.toString()??"";
      }else{
        return "";
      }
    }catch(e){
      return "";
    }
  }

  // Future requestIp() async{
  //   var userAgent = await FlutterOnlineEarn.instance.getDefaultUserAgent();
  //   _dio?.options.headers={"User-Agent":userAgent};
  //   try{
  //     var response = await _dio?.request<String>(
  //         "https://ipapi.co/json",
  //         options: Options(method: HttpMethod.get)
  //     );
  //     if(response?.statusCode==200){
  //       ip=jsonDecode(response?.data?.toString()??"")["ip"];
  //     }
  //   }catch(e){
  //
  //   }
  // }
}