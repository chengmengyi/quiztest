import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiznow/dialog/answer_fail/answer_fail_controller.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/view/image_view.dart';
import 'package:quiznow/view/text_view.dart';

class AnswerFailDialog extends StatelessWidget{
  Function(bool) call;
  late AnswerFailController controller;
  AnswerFailDialog({required this.call});

  @override
  Widget build(BuildContext context) {
    controller=Get.put(AnswerFailController());
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
            child: TextView(text: "Sorry, wrong answer", color: color004FC6, size: 20.sp,fontWeight: FontWeight.w700,),
          ),
          SizedBox(height: 30.w),
          ImageView(imagesName: "answer_fail1",width: 104.w,height: 80.h,),
        ],
      )
    ],
  );

  _btnWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      InkWell(
        onTap: (){
          controller.click(call,false);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ImageView(imagesName: "answer_right3",width: 210.w,height: 72.h,),
            TextView(text: "Answer again", color: colorFFFFFF, size: 20.sp,fontWeight: FontWeight.w700,)
          ],
        ),
      ),
      InkWell(
        onTap: (){
          controller.click(call,true);
        },
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: TextView(text: "Continue", color: colorFFFFFF.withOpacity(0.4), size: 14.sp),
        ),
      )
    ],
  );
}