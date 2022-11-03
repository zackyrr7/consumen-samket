import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/constant.dart';
import 'package:http/http.dart' as http;

class Cucii extends StatefulWidget {
  const Cucii({Key? key}) : super(key: key);

  @override
  State<Cucii> createState() => _CuciiState();
}

class _CuciiState extends State<Cucii> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
          child: _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: <Widget>[
                    logo(),
                    input(),
                    tombol(),
                    catatan(),
                  ],
                )),
    );
  }

  wash(
    String nama,
    String nomor_hp,
    String jenis,
  ) async {
    var jsonResponse = null;
    //try{
    final response = await http.post(Uri.parse("$url/cuci/"), body: {
      "nama": nama,
      "nomor_hp": nomor_hp,
      "jenis": jenis,
    });
    if (response.statusCode == 201) {
      jsonResponse = json.decode(response.body);
      print('Response Status: ${response.statusCode}');
      print('Response body: ${response.statusCode}');
      _showBerhasilDialog(context, String);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      _showAlertDialog(context, response.body);
      print(response.body);
    }
  }

  Container logo() {
    return Container(
      //color: Colors.white,
      margin: const EdgeInsets.only(top: 20.0),
      //padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Center(
          child: Flexible(
        child: Text(
          "Form Pemesanan Pencucian Mobil",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: ScreenUtil().setSp(25)),
        ),
      )),
    );
  }

  final _namaController = TextEditingController();
  final _nomorController = TextEditingController();
  final _jenisController = TextEditingController();

  Container input() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: TextFormField(
              controller: _namaController,
              cursorColor: Colors.black,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                fillColor: Colors.white
                //icon: Icon(Icons.email, color: Colors.black),
                ,
                hintText: "Nama Anda",
                //border: UnderlineInputBorder(
                //borderSide: BorderSide(color:Colors.white)),
                hintStyle: TextStyle(color: Colors.black87),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              color: Colors.white,
              child: TextFormField(
                controller: _nomorController,
                cursorColor: Colors.black,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  //icon: Icon(Icons.email, color: Colors.black),
                  hintText: "Nomor handphone",
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  hintStyle: TextStyle(color: Colors.black87),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              color: Colors.white,
              child: TextFormField(
                controller: _jenisController,
                cursorColor: Colors.black,
                //obscureText: true,
                style: const TextStyle(color: Colors.black87),
                decoration: const InputDecoration(
                  //icon: Icon(Icons.lock, color: Colors.black87),
                  hintText: "Jenis Kendaraan Anda",
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black87)),
                  hintStyle: TextStyle(color: Colors.black87),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container tombol() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      margin: const EdgeInsets.only(top: 15.0),
      child: ElevatedButton(
        onPressed: _namaController.text == "" ||
                _nomorController.text == "" ||
                _jenisController.text == ""
            ? null
            : () {
                setState(() {
                  _isLoading = true;
                });
                wash(
                  _namaController.text,
                  _nomorController.text,
                  _jenisController.text,
                );
              },

        //color: Colors.purple,
        child:
            const Text("Buat Pesanan", style: TextStyle(color: Colors.black)),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  Container catatan() {
    return Container(
        margin: const EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        height: ScreenUtil().setHeight(250),
        width: ScreenUtil().setWidth(300),
        child: Column(
          children: [
            Text("Catatan", style: TextStyle(fontSize: ScreenUtil().setSp(20))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Pencucian motor/mobil dapat dilakukan di AnD carwash (Sungai Jawi), Pihak dari Sampah Market akan melakukan pengecekan terkait saldo anda. Pihak sampah market akan melakukan konfirmasi kepada anda. Terima Kasih",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: ScreenUtil().setSp(12)),
              ),
            )
          ],
        ));
  }
}

_showBerhasilDialog(BuildContext context, String) {
  Widget okButton = FloatingActionButton(
    onPressed: () => Navigator.pop(context),
    child: const Text("Ok"),
  );
  AlertDialog alert = AlertDialog(
    title: const Text("Transaksi Berhasil"),
    content: Text('Pihak Sampah Market akan menkonfirmasi pesanan anda'),
    actions: [okButton],
  );
  showDialog(
      context: context,
      builder: ((context) {
        return alert;
      }));
}

_showAlertDialog(BuildContext context, String err) {
  Widget okButton = FloatingActionButton(
    onPressed: () => Navigator.pop(context),
    child: const Text("Ok"),
  );
  AlertDialog alert = AlertDialog(
    title: const Text("error"),
    content: Text(err),
    actions: [okButton],
  );
  showDialog(
      context: context,
      builder: ((context) {
        return alert;
      }));
}
