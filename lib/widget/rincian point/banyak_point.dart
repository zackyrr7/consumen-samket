import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/constant.dart';



class RincianBanyakPoint extends StatelessWidget {
  const RincianBanyakPoint({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: bgcolor,
          ),
          width: ScreenUtil().setWidth(360),
          height: ScreenUtil().setHeight(140),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    const Text(
                      "Poin sampah kamu sebesar:",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Row(
                      children: [
                        SizedBox(
                            height: ScreenUtil().setHeight(80),
                            // width: ScreenUtil().setWidth(50),
                            child: const Image(
                              image: AssetImage(
                                'assets/icons/coin.png',
                              ),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "10.000",
                          style: TextStyle(
                              fontSize: 20, color: Colors.black),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
