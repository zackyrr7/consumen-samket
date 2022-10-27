
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TombolRegister extends StatelessWidget {
  const TombolRegister({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: ScreenUtil().setHeight(20),
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      margin: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Belum mempunyai akun?",
            style: TextStyle(
                color: Colors.black54, fontSize: ScreenUtil().setSp(10)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: GestureDetector(
              onTap: () {},
              child: Text(
                "Daftar Sekarang",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: ScreenUtil().setSp(12)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
