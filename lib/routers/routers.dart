import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiznow/ui/page/answer_page/answer_page.dart';
import 'package:quiznow/ui/page/home/home_page.dart';
import 'package:quiznow/ui/page/main/main_page.dart';
import 'package:quiznow/ui/page/mine/mine_page.dart';
import 'package:quiznow/ui/page/web/web_page.dart';

class Routers{
  static const main="/main";
  static const home="/home";
  static const answer="/answer";
  static const mine="/mine";
  static const web="/web";

  static final routersList=[
    GetPage(
        name: main,
        page: () => MainPage(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: home,
        page: () => HomePage(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: answer,
        page: () => AnswerPage(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: mine,
        page: () => MinePage(),
        transition: Transition.fadeIn
    ),
    GetPage(
        name: web,
        page: () => WebPage(),
        transition: Transition.fadeIn
    ),
  ];

  static toPageByName({
    required String routerName,
    Map<String, dynamic>? params,
    Function(Map<String, dynamic>)? resultCallBack
  }){
    Get.toNamed(routerName, arguments: params)?.then((value) {
      if (null != resultCallBack && null != value) {
        resultCallBack(value);
      }
    });
  }

  static toPageOffLastName({required String router,}){
    Get.offNamed(router);
  }

  static offPage() {
    Get.back();
  }

  static Map<String, dynamic> getParams() {
    try {
      return Get.arguments as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }

  static showDialog({
    required Widget child,
    bool? barrierDismissible,
    Color? barrierColor
  }) {
    Get.dialog(
      child,
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible ?? true,
    );
  }

}