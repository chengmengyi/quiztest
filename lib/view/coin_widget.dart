import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quiznow/event/event_bus_util.dart';
import 'package:quiznow/util/colors.dart';
import 'package:quiznow/util/user_info_utils.dart';
import 'package:quiznow/view/image_view.dart';
import 'package:quiznow/view/text_view.dart';

class CoinWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _CoinWidgetState();
}

class _CoinWidgetState extends State<CoinWidget>{
  late StreamSubscription<EventData>? bus;

  @override
  void initState() {
    super.initState();
    bus=EventBusUtil.getInstance()?.on<EventData>().listen((data) {
      if(data.code==EventCode.updateCoinNum){
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Container(
        margin: EdgeInsets.only(left: 12.w),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            ImageView(imagesName: "home4",width: 90.w,height: 38.w,),
            Container(
              margin: EdgeInsets.only(left: 26.w,top: 4.w),
              child: TextView(text: "${UserInfoUtil.instance.coinNum}", color: color505FC8, size: 15.sp,fontWeight: FontWeight.w500,),
            )
          ],
        ),
      ),
      ImageView(imagesName: "home3",width: 38.w,height: 38.w,),
    ],
  );

  @override
  void dispose() {
    super.dispose();
    bus?.cancel();
    bus=null;
  }
}