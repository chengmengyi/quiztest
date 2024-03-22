import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/ui/page/home/home_controller.dart';
import 'package:quiznow/util/cloak_utils.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/util/storage_utils.dart';
import 'package:quiznow/util/task_utils.dart';
import 'package:quiznow/view/coin_widget.dart';
import 'package:quiznow/view/heart_widget.dart';
import 'package:quiznow/view/image_view.dart';
import 'package:quiznow/view/text_view.dart';

class HomePage extends StatelessWidget{
  var controller=Get.put(HomeController());

  @override
  Widget build(BuildContext context) => Scaffold(
    resizeToAvoidBottomInset: false,
    body: Stack(
      children: [
        ImageView(imagesName: "bg",width: double.infinity,height: double.infinity,fit: BoxFit.fill,),
        SafeArea(
          top: true,
          bottom: true,
          child: Column(
            children: [
              _topInfoWidget(),
              SizedBox(height: 8.w,),
              _contentWidget(),
            ],
          ),
        )
      ],
    ),
  );

  _topInfoWidget()=>Row(
    children: [
      InkWell(
        onTap: (){
          Routers.toPageByName(routerName: Routers.mine);
        },
        child: ImageView(imagesName: "home1",width: 100.w,height: 100.w,),
      ),
      SizedBox(width: 12.w,),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<HomeController>(
            id: "name",
            builder: (_)=>InkWell(
              onTap: (){
                controller.showChangeNameDialog();
              },
              child: TextView(text: StorageUtils.read<String>(StorageName.userName)??"Hello User", color: colorFFFFFF, size: 20.sp,fontWeight: FontWeight.w700,),
            ),
          ),
          SizedBox(height: 10.w,),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CoinWidget(),
              HeartWidget(),
            ],
          ),
        ],
      )
    ],
  );

  _contentWidget()=>Stack(
    alignment: Alignment.topCenter,
    children: [
      ImageView(imagesName: "home7",width: double.infinity,height: 582.h,fit: BoxFit.fill,),
      Container(
        padding: EdgeInsets.only(left: 16.w,right: 16.w,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _categoryWidget(),
            SizedBox(height: 20.w,),
            _dailyTaskWidget(),
          ],
        ),
      ),
    ],
  );

  _categoryWidget()=>Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        margin: EdgeInsets.only(top: 12.w),
        child: ImageView(imagesName: "home8",width: 236.w,height: 46.h,fit: BoxFit.fill,),
      ),
      Container(
        width: double.infinity,
        height: 100.h,
        margin: EdgeInsets.only(top: 20.w),
        child: ListView.builder(
          itemCount: controller.categoryList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index)=>InkWell(
            onTap: (){
              Routers.toPageByName(routerName: Routers.answer,params: {"index":index});
            },
            child: Container(
              margin: EdgeInsets.only(left: 12.w),
              child: ImageView(imagesName: controller.categoryList[index],width: 113.w,height: 100.h,),
            ),
          ),
        ),
      )
    ],
  );

  _dailyTaskWidget()=>GetBuilder<HomeController>(
    id: "task",
    builder: (_)=>Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageView(imagesName: "home14",width: 236.w,height: 46.w,),
        Container(
          width: double.infinity,
          height: 69.w,
          margin: EdgeInsets.only(left: 16.w,right: 16.w,top: 30.w),
          decoration: BoxDecoration(
            color: colorE7EBFE,
            borderRadius: BorderRadius.circular(12.w),
          ),
          child: Row(
            children: [
              SizedBox(width: 7.w,),
              ImageView(imagesName: "home15",width: 45.w,height: 45.w,),
              SizedBox(width: 10.w,),
              Expanded(child: TextView(text: "Play one science quiz", color: color3947AE, size: 15.sp),),
              InkWell(
                onTap: (){
                  controller.clickTaskBtn(0,TaskUtils.instance.scienceState);
                },
                child: ImageView(imagesName: controller.getTaskBtnRes(TaskUtils.instance.scienceState),width: 87.w,height: 45.h,),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 69.w,
          margin: EdgeInsets.only(left: 16.w,right: 16.w,top: 12.w),
          decoration: BoxDecoration(
            color: colorE7EBFE,
            borderRadius: BorderRadius.circular(12.w),
          ),
          child: Row(
            children: [
              SizedBox(width: 7.w,),
              ImageView(imagesName: "home18",width: 45.w,height: 45.w,),
              SizedBox(width: 10.w,),
              Expanded(
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Get",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: color3947AE
                              )
                          ),
                          TextSpan(
                              text: " 100 ",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: colorED5601,
                                  fontWeight: FontWeight.w600
                              )
                          ),
                          TextSpan(
                              text: "coin in Math quiz",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: color3947AE
                              )
                          ),
                        ]
                    )
                ),
              ),
              InkWell(
                onTap: (){
                  controller.clickTaskBtn(1,TaskUtils.instance.getCoin100State);
                },
                child: ImageView(imagesName: controller.getTaskBtnRes(TaskUtils.instance.getCoin100State),width: 87.w,height: 45.h,),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 69.w,
          margin: EdgeInsets.only(left: 16.w,right: 16.w,top: 12.w),
          decoration: BoxDecoration(
            color: colorE7EBFE,
            borderRadius: BorderRadius.circular(12.w),
          ),
          child: Row(
            children: [
              SizedBox(width: 7.w,),
              ImageView(imagesName: "home19",width: 45.w,height: 45.w,),
              SizedBox(width: 10.w,),
              Expanded(
                child: RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(
                              text: "Answer",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: color3947AE
                              )
                          ),
                          TextSpan(
                              text: " 30 ",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: colorED5601,
                                  fontWeight: FontWeight.w600
                              )
                          ),
                          TextSpan(
                              text: "questions correctly",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: color3947AE
                              )
                          ),
                        ]
                    )
                ),
              ),
              InkWell(
                onTap: (){
                  controller.clickTaskBtn(2,TaskUtils.instance.answerRight30State);
                },
                child: ImageView(imagesName: controller.getTaskBtnRes(TaskUtils.instance.answerRight30State),width: 87.w,height: 45.h,),
              )
            ],
          ),
        ),
      ],
    ),
  );
}