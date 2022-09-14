// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/demo.dart';
import 'package:sampah_market/list_tanya.dart';
import 'package:sampah_market/widget/bantuan/detail.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sampah_market/widget/bantuan/hubungin.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Bantuan extends StatelessWidget {
  const Bantuan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pertanyaan yang sering ditanyakan",
          style: TextStyle(fontSize: 15),
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
              width: ScreenUtil().setWidth(360),
              height: ScreenUtil().setHeight(700),
              child: ListView.builder(
                  itemCount: tanyaList.length,
                  itemBuilder: (context, index) {
                    Tanya tanya = tanyaList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Detail(tanya)));
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: ScreenUtil().setHeight(50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(tanya.judul),
                          ),
                        ),
                      ),
                    );
                  })),
          GestureDetector(
            onTap: () {
              _openWhatsAppChat();
            },
            child: const HubunginKami(),
          )
        ],
      ),
    );
  }
}

void _openWhatsAppChat() async {
  String phoneNumber = '+6281347771171';
  String kalimat = 'Halo Admin';
  String url = 'https://wa.me/$phoneNumber?text=$kalimat';

  // ignore: deprecated_member_use
  await launch(url);
}
