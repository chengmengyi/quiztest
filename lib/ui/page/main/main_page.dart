import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiznow/ui/page/main/main_controller.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/view/image_view.dart';

class MainPage extends StatelessWidget{
  var controller=Get.put(MainController());

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      alignment: Alignment.center,
      children: [
        ImageView(imagesName: "bg",width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ImageView(imagesName: "logo",width: 90.w,height: 90.w,),
            SizedBox(height: 60.w,),
            Container(
              margin: EdgeInsets.only(left: 90.w,right: 90.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(43.w),
                child: LinearProgressIndicator(
                  minHeight: 10.w,
                  backgroundColor: colorFFFFFF,
                  color: color5362CA,
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}