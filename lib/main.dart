import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



import 'package:sampah_market/widget/botomnavbar.dart';

import 'package:sampah_market/theme.dart';



void main() {
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
          //home: const MyBotNavbar(),
          home: const MyBotNavbar(),
          
        );
      },
    );
  }
}
