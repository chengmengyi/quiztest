import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiznow/event/event_bus_util.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/util/user_info_utils.dart';
import 'package:quiznow/view/image_view.dart';
import 'package:quiznow/view/text_view.dart';

class HeartWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HeartWidgetState();
}

class _HeartWidgetState extends State<HeartWidget>{
  late StreamSubscription<EventData>? bus;

  @override
  void initState() {
    super.initState();
    bus=EventBusUtil.getInstance()?.on<EventData>().listen((data) {
      if(data.code==EventCode.updateHeartNum){
        setState(() {});
      }
    });
  }
  @override
  Widget build(BuildContext context){
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.w),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              ImageView(imagesName: "home6",width: 61.w,height: 38.w,),
              Container(
                width: 26.w,
                height: 18.w,
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20.w,top: 4.w),
                decoration: BoxDecoration(
                    color: color69BCA9,
                    borderRadius: BorderRadius.circular(5.w)
                ),
                child: TextView(text: "${UserInfoUtil.instance.heartNum}", color: color505FC8, size: 15.sp,fontWeight: FontWeight.w500,),
              )
            ],
          ),
        ),
        ImageView(imagesName: "home5",width: 38.w,height: 38.w,),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    bus?.cancel();
    bus=null;
  }
}