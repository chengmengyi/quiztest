import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/view/image_view.dart';
import 'package:quiznow/view/text_view.dart';

class NoAnswerCountDialog extends StatelessWidget{
  @override
  Widget build(BuildContext context) => WillPopScope(
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


  _contentWidget()=>Stack(
    alignment: Alignment.center,
    children: [
      ImageView(imagesName: "answer_right1",width: 296.w,height: 215.h,fit: BoxFit.fill,),
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ImageView(imagesName: "no_answer_count",width: 78.w,height: 60.h,),
          SizedBox(height: 26.w,),
          Container(
            margin: EdgeInsets.only(left: 56.w,right: 56.w),
            child: TextView(text: "Sorry,the number of answers today has been exhausted. Please come back to challenge again tomorrow.", color: colorFFFFFF, size: 14.sp),
          )
        ],
      )
    ],
  );

  _btnWidget()=>InkWell(
    onTap: (){
      Routers.offPage();
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        ImageView(imagesName: "answer_right3",width: 210.w,height: 72.h,),
        TextView(text: "Ok", color: colorFFFFFF, size: 20.sp,fontWeight: FontWeight.w700,)
      ],
    ),
  );
}