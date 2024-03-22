import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiznow/dialog/change_name/change_name_controller.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/view/image_view.dart';

class ChangeNameDialog extends StatelessWidget{
  Function() sureCall;
  late ChangeNameController changeNameController;
  ChangeNameDialog({required this.sureCall});

  @override
  Widget build(BuildContext context) {
    changeNameController=Get.put(ChangeNameController());
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: (){
                  Routers.offPage();
                },
                child: Container(
                  margin: EdgeInsets.only(right: 28.w),
                  child: ImageView(imagesName: "close",width: 26.w,height: 26.h,),
                ),
              ),
            ),
            _inputWidget(),
            SizedBox(height: 10.w,),
            _btnWidget(),
          ],
        ),
      ),
    );
  }
  
  _inputWidget()=>Stack(
    alignment: Alignment.bottomCenter,
    children: [
      ImageView(imagesName: "change_name_bg",width: 326.w,height: 208.h,fit: BoxFit.fill,),
      Container(
        width: 264.w,
        height: 54.h,
        alignment: Alignment.center,
        margin: EdgeInsets.only(bottom: 65.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: color0046B0
        ),
        child: TextField(
          enabled: true,
          maxLength: 10,
          textAlign: TextAlign.center,
          controller: changeNameController.textEditingController,
          style: TextStyle(
            fontSize: 20.sp,
            color: colorFFFFFF,
          ),
          decoration: InputDecoration(
            counterText: '',
            isCollapsed: true,
            hintText: 'Please input your account',
            hintStyle: TextStyle(
              fontSize: 20.sp,
              color: color3473D1,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    ],
  );

  _btnWidget()=>InkWell(
    onTap: (){
      changeNameController.clickSure(sureCall);
    },
    child: Container(
      width: 190.w,
      height: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: colorAD5AF2,
          borderRadius: BorderRadius.circular(14.w)
      ),
      child: ImageView(imagesName: "ok",height: 27.h,),
    ),
  );
}