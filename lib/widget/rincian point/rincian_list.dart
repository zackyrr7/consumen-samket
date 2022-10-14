import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/demo.dart';

class RincianList extends StatelessWidget {
  const RincianList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.red,
      width: ScreenUtil().setWidth(360),
      height: ScreenUtil().setHeight(499),
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
                    Text(
                      dataHistory[index]['nama'],
                      style: const TextStyle(fontSize: 22),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "Berat",
                              style: TextStyle(color: Colors.grey),
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
                                style: TextStyle(color: Colors.grey)),
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
    );
  }
}

