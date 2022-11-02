import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmasMini extends StatefulWidget {
  const EmasMini({Key? key}) : super(key: key);

  @override
  State<EmasMini> createState() => _EmasMiniState();
}

class _EmasMiniState extends State<EmasMini> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "Form Penukaran Emas Mini",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )),

            //jenis sampah
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((10))),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    maxLines: null,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: UnderlineInputBorder(),
                        labelText: 'Berat Emas yang diinginkan',
                        labelStyle: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
            ),
            //nama
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((10))),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: UnderlineInputBorder(),
                        labelText: 'Nama',
                        labelStyle: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
            ),

            //nomor
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((10))),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    maxLines: null,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: UnderlineInputBorder(),
                        labelText: 'Nomor Handphone anda',
                        labelStyle: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text("buat Transaksi")),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: ScreenUtil().setHeight(250),
                width: ScreenUtil().setWidth(300),
                child: Column(
                  children: [
                    Text("Catatan",
                        style: TextStyle(fontSize: ScreenUtil().setSp(20))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Berat emas mini yang tersedia sebesar \n0.025 gram dengan saldo 60.000\n0.05 gram dengan saldo 90.000\n0.1 gram dengan saldo 150.000\n0.2 gram dengan saldo 280.000\n0.5 gram dengan saldo 595.000\nPihak admin akan melakukan konfirmasi kepada anda. Terima Kasih",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
