import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/ui/page/web/web_controller.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/view/image_view.dart';
import 'package:quiznow/view/text_view.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatelessWidget{
  var controller=Get.put(WebController());

  @override
  Widget build(BuildContext context) =>Scaffold(
    body: Stack(
      children: [
        ImageView(imagesName: "bg3",width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
        SafeArea(
          top: true,
          bottom: true,
          child: Column(
            children: [
              _topWidget(),
              Expanded(
                child: WebViewWidget(controller: controller.webViewController),
              )
            ],
          ),
        )
      ],
    ),
  );

  _topWidget()=>Container(
    margin: EdgeInsets.all(12.w),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: InkWell(
            onTap: (){
              Routers.offPage();
            },
            child: ImageView(imagesName: "back",width: 35.w,height: 35.w,),
          ),
        ),
        TextView(text: controller.title, color: colorFFFFFF, size: 16.sp,fontWeight: FontWeight.w600,)
      ],
    ),
  );
}