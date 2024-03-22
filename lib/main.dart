import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quiznow/routers/routers.dart';
import 'package:quiznow/ui/page/main/main_page.dart';
import 'package:quiznow/util/cloak_utils.dart';
import 'package:quiznow/util/question_util.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initAppInfo();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarDividerColor: null,
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        //顶部导航栏字体颜色
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        //底部导航栏颜色
        systemNavigationBarColor: Colors.white,
      ));
  runApp(const MyApp());
}

initAppInfo()async{
  await GetStorage.init();
  QuestionUtil.instance.initQuestionList();
  CloakUtils.instance.requestCloak();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      builder: (context,child)=>GetMaterialApp(
        title: 'QuizNow',
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: '/',
        getPages: Routers.routersList,
        defaultTransition: Transition.rightToLeft,
        themeMode: ThemeMode.system,
        darkTheme: ThemeData.dark(),
        home: MainPage(),
      ),
    );
  }
}