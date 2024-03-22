import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/ui/page/answer_page/answer_controller.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/view/coin_widget.dart';
import 'package:quiznow/view/heart_widget.dart';
import 'package:quiznow/view/image_view.dart';
import 'package:quiznow/view/text_view.dart';

class AnswerPage extends StatelessWidget{
  var controller=Get.put(AnswerController());

  @override
  Widget build(BuildContext context) =>Scaffold(
    body: Stack(
      children: [
        ImageView(imagesName: "bg2",width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
        SafeArea(
          top: true,
          bottom: true,
          child: Column(
            children: [
              _topWidget(),
              SizedBox(height: 50.w,),
              _contentWidget(),
            ],
          ),
        )
      ],
    ),
  );

  _topWidget()=>Row(
    children: [
      SizedBox(width: 16.w,),
      InkWell(
        onTap: (){
          Routers.offPage();
        },
        child: ImageView(imagesName: "back",width: 35.w,height: 35.w,),
      ),
      const Spacer(),
      CoinWidget(),
      HeartWidget(),
      SizedBox(width: 16.w,),
    ],
  );
  
  _contentWidget()=>Stack(
    alignment: Alignment.topCenter,
    children: [
      ImageView(imagesName: "answer1",width: double.infinity,height: 530.h,fit: BoxFit.fill,),
      Container(
        margin: EdgeInsets.only(left: 16.w,right: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16.w),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ImageView(imagesName: "answer2",width: 236.w,height: 65.h,),
                  Container(
                    margin: EdgeInsets.only(bottom: 8.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextView(text: controller.getTitleByType(), color: color505FC8, size: 20.sp,fontWeight: FontWeight.w600,),
                        SizedBox(height: 12.w,),
                        GetBuilder<AnswerController>(
                          id: "answer",
                          builder: (_)=>Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: 107.w,
                                height: 4.h,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14.w),
                                  child: LinearProgressIndicator(
                                    backgroundColor: colorA5D2D1,
                                    value: (controller.questionIndex+1)/controller.questionSize,
                                    color: color239EA9,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6.w,),
                              TextView(text: "${controller.questionIndex+1}/${controller.questionSize}", color: color000000, size: 10.sp,fontWeight: FontWeight.w600,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.w,),
            Stack(
              alignment: Alignment.center,
              children: [
                ImageView(imagesName: "answer3",width: 296.w,height: 146.h,fit: BoxFit.fill,),
                Container(
                  margin: EdgeInsets.only(left: 30.w,right: 30.w),
                  child: GetBuilder<AnswerController>(
                    id: "answer",
                    builder: (_)=>TextView(text: "${controller.currentQuestion?.question}", color: color333333, size: 16.sp,fontWeight: FontWeight.w600,),
                  ),
                )
              ],
            ),
            SizedBox(height: 22.w,),
            GetBuilder<AnswerController>(
              id: "answer",
              builder: (_)=>Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _answerItemWidget(0),
                  _answerItemWidget(1),
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );

  _answerItemWidget(index)=>InkWell(
    onTap: (){
      controller.clickAnswer(index);
    },
    child: Container(
      width: double.infinity,
      height: 68.w,
      margin: EdgeInsets.only(left: 30.w,right: 30.w,top: 22.w),
      decoration: BoxDecoration(
        color: controller.currentQuestion?.clickIndex==index?
        (controller.currentQuestion?.answerResult==true?color3DC18A:colorF07B70):
        colorE7EBFE,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextView(
            text: index==0?controller.currentQuestion?.a??"":controller.currentQuestion?.b??"",
            color: color505FC8,
            size: 18.sp,
            fontWeight: FontWeight.w600,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Offstage(
              offstage: controller.currentQuestion?.clickIndex!=index,
              child: Container(
                margin: EdgeInsets.only(right: 36.w),
                child: ImageView(
                  imagesName: controller.currentQuestion?.answerResult==true?"right":"fail",
                  width: 20.w,
                  height: 20.w,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}