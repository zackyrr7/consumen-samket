import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/demo.dart';

class TukarPoint extends StatelessWidget {
  const TukarPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tukar Point")),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: tukar.length,
          itemBuilder: (((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridTile(
                  child: Flexible(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Container(
                          color: Colors.white,
                          width: ScreenUtil().setWidth(180),
                          height: ScreenUtil().setHeight(120),
                          child: Image(
                            image: AssetImage(tukar[index]["foto"]),
                            fit: BoxFit.contain,
                          )),
                      Center(
                        child: Text(
                          tukar[index]["nama"],
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              )),
            );
          }))),
    );
  }
}
