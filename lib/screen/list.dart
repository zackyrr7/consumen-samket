import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sampah_market/demo.dart';

class List extends StatelessWidget {
  const List({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "List Barang yang dijual",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    SizedBox(
                        width: ScreenUtil().setWidth(200),
                        child: Image(
                          image: AssetImage(
                            dataList[index]['foto'],
                          ),
                          fit: BoxFit.cover,
                        )),
                    Text(
                      dataList[index]['nama'],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Rp."),
                        Text(
                          dataList[index]['harga'],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
