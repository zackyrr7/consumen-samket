import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:sampah_market/screen/login.dart';

import 'package:sampah_market/widget/botomnavbar.dart';

import 'package:sampah_market/theme.dart';

void main() async{
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Sampah market",
          theme: buildThemeData(),
          //home: const LoginPage(),
        home: const MyBotNavbar(),
        );
      },
    );
  }
}
