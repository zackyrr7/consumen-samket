import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/constant.dart';
import 'package:sampah_market/demo.dart';

class Riwayat extends StatelessWidget {
  const Riwayat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: List.generate(
                      dataHistory.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          height: ScreenUtil().setHeight(100),
                          child: Column(
                            children: [
                              Text(dataHistory[index]['nama'],style: const TextStyle(fontSize: 22),),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        "Berat",
                                        style:
                                             TextStyle(color: Colors.grey),
                                      ),
                                      Text(
                                        dataHistory[index]['Berat'],
                                        style: const TextStyle(fontSize: 20),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text("Total",
                                          style:  TextStyle(color: Colors.grey)),
                                      Text(dataHistory[index]['Total'],
                                          style: const TextStyle(fontSize: 20))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
