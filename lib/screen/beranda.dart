import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/screen/get_barang.dart';
import 'package:sampah_market/widget/Beranda/card_jual.dart';
import 'package:sampah_market/widget/Beranda/card_list.dart';
import 'package:sampah_market/widget/Beranda/card_point.dart';
import 'package:sampah_market/widget/Beranda/card_tukar.dart';
import 'package:sampah_market/widget/Beranda/logo_nama.dart';


class Beranda extends StatelessWidget {
  const Beranda({Key? key}) : super(key: key);

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
                    color: Color(0xFF7BF091),
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
              child: SizedBox(
                  width: ScreenUtil().setWidth(360), child: const Cardjual())),
        ],
      ),
    );
  }
}
