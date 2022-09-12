// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/demo.dart';
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
                  itemCount: dataTanya.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Detail(dataTanya[index], jawaban: '', judul: '',)));
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: ScreenUtil().setHeight(50),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: Text(dataTanya[index]['judul']),
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
