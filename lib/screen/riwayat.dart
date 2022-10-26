import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/constant.dart';
import 'package:sampah_market/demo.dart';
import 'package:sampah_market/widget/rincian%20point/rincian_list.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(
          top: 55,
          width: ScreenUtil().setWidth(360),
          child: const SizedBox(
              child: Center(
                  child: Text(
            "History Penjualan",
            style: TextStyle(fontSize: 25, color: hijauMain),
          )))),
      Positioned(
          top: 130,
          left: 11,
          child: SizedBox(
              // color: Colors.red,
              width: ScreenUtil().setWidth(340),
              height: ScreenUtil().setHeight(650),
              child: const RincianList())),
    ]));
  }
}
