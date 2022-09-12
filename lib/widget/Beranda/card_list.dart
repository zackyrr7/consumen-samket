import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/constant.dart';

class CardList extends StatelessWidget {
  const CardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        width: ScreenUtil().setWidth(340),
        height: ScreenUtil().setHeight(70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.restore_from_trash_rounded,
                    size: 40,
                    color: biruMain,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "List Sampah yang dapat dijual",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(">", style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}
