import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/screen/get_barang.dart';
import 'package:sampah_market/screen/login.dart';
import 'package:sampah_market/screen/pesan.dart';
import 'package:sampah_market/widget/Beranda/card_jual.dart';
import 'package:sampah_market/widget/Beranda/card_list.dart';
import 'package:sampah_market/widget/Beranda/card_point.dart';
import 'package:sampah_market/widget/Beranda/card_tukar.dart';
import 'package:sampah_market/widget/Beranda/logo_nama.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {

  late final SharedPreferences sharedPreferences;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => const LoginPage()), (Route<dynamic> route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              bottom: 0,
              child: Container(
                height: ScreenUtil().setHeight(500),
                width: ScreenUtil().setWidth(360),
                decoration: const BoxDecoration(
                    color: Color.fromARGB(153, 123, 240, 144),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(75),
                        topRight: Radius.circular(75))),
              )),
          Positioned(
              top: 85,
              child: SizedBox(
                width: ScreenUtil().setWidth(360),
                child: const Namalogo(),
              )),
          Positioned(
              top: 220,
              child: SizedBox(
                  width: ScreenUtil().setWidth(360), child: const CardPoint())),
          Positioned(
              top: 380,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Get();
                  }));
                },
                child: SizedBox(
                    width: ScreenUtil().setWidth(360), child: const CardList()),
              )),
          Positioned(
              top: 560,
              child: SizedBox(
                  width: ScreenUtil().setWidth(360), child: const CardTukar())),
          Positioned(
              top: 470,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const Pesan();
                  }));
                },
                child: SizedBox(
                    width: ScreenUtil().setWidth(360), child: const Cardjual()),
              )),
        ],
      ),
    );
  }
}
