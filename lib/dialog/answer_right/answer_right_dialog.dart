import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiznow/dialog/answer_right/answer_right_controller.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/view/image_view.dart';
import 'package:quiznow/view/text_view.dart';

class AnswerRightDialog extends StatelessWidget{
  Function() call;
  late AnswerRightController controller;
  AnswerRightDialog({required this.call});

  @override
  Widget build(BuildContext context) {
    controller=Get.put(AnswerRightController());
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
      ImageView(imagesName: "answer_right1",width: 326.w,height: 282.h,),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 236.w,
            height: 45.h,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20.w),
            decoration: BoxDecoration(
              color: colorE7EBFE,
              borderRadius: BorderRadius.circular(11.w)
            ),
            child: TextView(text: "Answer is Right", color: color004FC6, size: 20.sp,fontWeight: FontWeight.w700,),
          ),
          ImageView(imagesName: "answer_right2",width: 230.w,height: 162.h,),
          TextView(text: "+10", color: colorFFFFFF, size: 30.sp,fontWeight: FontWeight.w700,)
        ],
      )
    ],
  );

  _btnWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
        onTap: (){
          controller.click(call);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageView(imagesName: "answer_right3",width: 210.w,height: 72.h,),
            TextView(text: "Get Gold", color: colorFFFFFF, size: 30.sp,fontWeight: FontWeight.w700,)
          ],
        ),
      ),
      InkWell(
        onTap: (){
          controller.click(call);
        },
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: TextView(text: "Continue", color: colorFFFFFF.withOpacity(0.4), size: 14.sp),
        ),
      )
    ],
  );
}