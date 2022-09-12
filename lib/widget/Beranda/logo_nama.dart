import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Namalogo extends StatelessWidget {
  const Namalogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(60),
              ),
              color: Colors.white),
          height: ScreenUtil().setHeight(90),
          width: ScreenUtil().setHeight(100),
          child: Image.asset("assets/icons/sampah.png"),
        ),
        Column(
          children: const [
            Text("Selamat datang"),
            Text("Jangan Lupa Jaga Kebersihan")
          ],
        )
      ],
    );
  }
}
