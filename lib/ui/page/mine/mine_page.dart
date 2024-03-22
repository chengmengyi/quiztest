import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/ui/page/mine/mine_controller.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/view/image_view.dart';
import 'package:quiznow/view/text_view.dart';

class MinePage extends StatelessWidget{
  var controller=Get.put(MineController());

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
              SizedBox(height: 30.w,),
              _itemWidget(0,"mine1","Privacy Policy"),
              _itemWidget(1,"mine2","Term of User"),
              _itemWidget(2,"mine2","Contact us"),
            ],
          ),
        )
      ],
    ),
  );

  _itemWidget(index,icon,title)=>InkWell(
    onTap: (){
      controller.clickItem(index);
    },
    child: Container(
      width: double.infinity,
      height: 68.h,
      padding: EdgeInsets.only(left: 18.w,right: 18.w),
      margin: EdgeInsets.only(left: 25.w,right: 25.w,top: 22.w),
      decoration: BoxDecoration(
        color: colorE7EBFE,
        borderRadius: BorderRadius.circular(12.w),
      ),
      child: Row(
        children: [
          ImageView(imagesName: icon,width: 38.w,height: 38.w,),
          SizedBox(width: 16.w,),
          TextView(text: title, color: color333333, size: 16.sp,fontWeight: FontWeight.w600,),
          const Spacer(),
          ImageView(imagesName: "right2",width: 18.w,height: 18.w,)
        ],
      ),
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
    ],
  );
}