import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart'; // أضف هذا
import 'firebase_options.dart'; // أضف هذا

import '../../Constants.dart';
import '../../splash_screen.dart';
import '../../language/translations.dart';
import '../../router/custom_router.dart';
import '../../router/route_constants.dart';
import '../../text_theme.dart';
import 'apiservice/checkInterNet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ضروري قبل أي await
  await GetStorage.init();
  Get.put(CheckInterNet());

  // **تفعيل Firebase**
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(360, 690),
      builder: (context, child) => GetMaterialApp(
        navigatorKey: mainNavigatorKey,
        debugShowCheckedModeBanner: false,
        translations: Translation(),
        locale: Locale(GetStorage().read(language) ?? 'ar'),
        fallbackLocale: Get.deviceLocale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('ar', ''),
        ],
        title: "title app",
        theme: themeData,
        getPages: Pages.pages(),
        defaultTransition: Transition.rightToLeftWithFade,
        transitionDuration: Duration(milliseconds: 400),
        initialRoute: RoutingApp.InteroRoute,
      ),
    );
  }
}
