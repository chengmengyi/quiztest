import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiznow/dialog/comlete_task/complete_task_controller.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/view/image_view.dart';
import 'package:quiznow/view/text_view.dart';

class CompleteTaskDialog extends StatelessWidget{
  Function() getReward;
  Function() continueCall;
  late CompleteTaskController controller;
  CompleteTaskDialog({required this.getReward,required this.continueCall});

  @override
  Widget build(BuildContext context) {
    controller=Get.put(CompleteTaskController());
    return WillPopScope(
        child: Material(
          type: MaterialType.transparency,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _contentWidget(),
                _btnWidget(),
              ],
            ),
          ),
        ),
        onWillPop: ()async{
          return false;
        }
    );
  }

  _contentWidget()=>Stack(
    alignment: Alignment.topCenter,
    children: [
      Container(
        margin: EdgeInsets.only(top: 24.w),
        child: ImageView(imagesName: "answer_right1",width: 326.w,height: 251.h,fit: BoxFit.fill,),
      ),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageView(imagesName: "task_dialog1",width: 106.w,height: 106.h,),
          Container(
            margin: EdgeInsets.only(left: 62.w,right: 62.w,top: 12.w),
            child: TextView(text: "Congratulations on completing today's task", color: colorFFFFFF, size: 22.sp,fontWeight: FontWeight.w700,),
          )
        ],
      )
    ],
  );

  _btnWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
        onTap: (){
          Routers.offPage();
          getReward();
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageView(imagesName: "answer_right3",width: 210.w,height: 72.h,),
            TextView(text: "Get Reward", color: colorFFFFFF, size: 30.sp,fontWeight: FontWeight.w700,)
          ],
        ),
      ),
      InkWell(
        onTap: (){
          Routers.offPage();
          continueCall();
        },
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: TextView(text: "Continue", color: colorFFFFFF.withOpacity(0.4), size: 14.sp),
        ),
      )
    ],
  );
}