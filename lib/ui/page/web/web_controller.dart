import 'package:get/get.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebController extends GetxController{
  var title="";
  late WebViewController webViewController;

  @override
  void onInit() {
    super.onInit();
    var params = Routers.getParams();
    title=params["title"];
    webViewController=WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
    // ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(params["url"]));
  }
}