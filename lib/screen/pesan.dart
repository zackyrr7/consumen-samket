import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/constant.dart';
import 'package:http/http.dart' as http;
import 'package:sampah_market/model/repository_get_akun.dart';
import 'package:sampah_market/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class Pesan extends StatefulWidget {
  const Pesan({Key? key}) : super(key: key);

  @override
  State<Pesan> createState() => _PesanState();
}

class _PesanState extends State<Pesan> {
  late SharedPreferences sharedPreferences;
  Service serviceApi = Service();
  late Future<User?> listUser;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    //listUser = serviceApi.getAllUser();
    listUser = serviceApi.getAllUser();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (BuildContext context) => const LoginPage()),
          (Route<dynamic> route) => false);
    }
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));
    return Scaffold(
        body: FutureBuilder<User?>(
            future: listUser,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                User isiUser = snapshot.data!;
                return Container(
                    child: _isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView(
                            children: <Widget>[
                              logo(),
                              input(),
                              tombol(),
                              
                              //catatan(),
                            ],
                          ));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return const Center(child: CircularProgressIndicator());
            })));
  }

  transaksi(
    String nama,
    String nomor_hp,
    String barang,
    String alamat,
    String tanggal,
  ) async {
    var jsonResponse = null;
    //try{
    final response = await http.post(Uri.parse("$url/pesan/"), body: {
      "nama": nama,
      "nomor_hp": nomor_hp,
      "barang": barang,
      "alamat": alamat,
      "tanggal": tanggal
    });
    if (response.statusCode == 200) {
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
          "Form Penjualan Barang",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: ScreenUtil().setSp(25)),
        ),
      )),
    );
  }

  final _namaController = TextEditingController();
  final _nomorController = TextEditingController();
  final _barangController = TextEditingController();
  final _alamatController = TextEditingController();
  final _tanggalController = TextEditingController();

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
                controller: _barangController,
                cursorColor: Colors.black,
                //obscureText: true,
                style: const TextStyle(color: Colors.black87),
                decoration: const InputDecoration(
                  //icon: Icon(Icons.lock, color: Colors.black87),
                  hintText: "Jenis barang yang ingin anda jual",
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
                controller: _alamatController,
                cursorColor: Colors.black,
                //obscureText: true,
                style: const TextStyle(color: Colors.black87),
                decoration: const InputDecoration(
                  //icon: Icon(Icons.lock, color: Colors.black87),
                  hintText: "Alamat anda",
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
                controller: _tanggalController,
                cursorColor: Colors.black,
                //obscureText: true,
                style: const TextStyle(color: Colors.black87),
                decoration: const InputDecoration(
                  //icon: Icon(Icons.lock, color: Colors.black87),
                  hintText: "Tanggal yang anda inginkan",
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
                _alamatController.text == "" ||
                _tanggalController.text == "" ||
                _barangController.text == ""
            ? null
            : () {
                setState(() {
                  _isLoading = true;
                });
                transaksi(
                    _namaController.text,
                    _nomorController.text,
                    _barangController.text,
                    _tanggalController.text,
                    _alamatController.text);
              },

        //color: Colors.purple,
        child:
            const Text("Buat Pesanan", style: TextStyle(color: Colors.black)),
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
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
