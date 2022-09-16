import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/constant.dart';
import 'package:sampah_market/screen/rincian_screen.dart';

class CardPoint extends StatelessWidget {
  const CardPoint({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: biruMain,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 5.0,
              ),
            ],
          ),
          // width: ScreenUtil().setWidth(100),
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
                      style: TextStyle(color: Colors.white),
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
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const RincianPoint();
                })),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: hijauMain,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.5), //(x,y)
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  width: ScreenUtil().setWidth(50),
                  height: ScreenUtil().setHeight(95),
                  child: const Center(
                      child: Expanded(
                    child: Text(
                      "Rincian Point",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
