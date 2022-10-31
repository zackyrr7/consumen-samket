import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/model/register_model.dart';
import 'package:sampah_market/model/repository_register.dart';
import 'package:sampah_market/screen/login.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Service serviceApi = Service();
  String nameController = '';
  var jsonResponse = null;
  bool _isLoading = false;

  final _nameController = TextEditingController();
  final _nomorController = TextEditingController();
  final _passController = TextEditingController();
  final _passConController = TextEditingController();

  late Future<UserRegis> _futureUserRegis;

  register(String name, String nomor_hp, String password,
      String password_confirmation) async {
    //try{
    final response = await http.post(Uri.parse("$url/auth/register/"), body: {
      "name": name,
      "nomor_hp": nomor_hp,
      "password": password,
      "password_confirmation": password_confirmation,
    });
    if (response.statusCode == 201) {
      jsonResponse = json.decode(response.body);
      // ignore: avoid_print
      print('Response status: ${response.statusCode}');
      // ignore: avoid_print
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        //saveString("token", jsonResponse['token'].toString());

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      _showAlertDialog(context, response.body);
      // ignore: avoid_print
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: ScreenUtil().setWidth(360),
              margin: const EdgeInsets.only(top: 70.0),
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(100),
                    width: ScreenUtil().setWidth(150),
                    child: Image.asset("assets/icons/sampah.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular((10))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 2,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: UnderlineInputBorder(),
                              labelText: 'Nama Anda',
                              labelStyle: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular((10))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextFormField(
                          minLines: 1,
                          controller: _nomorController,
                          keyboardType: TextInputType.number,
                          maxLines: null,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: UnderlineInputBorder(),
                              labelText: 'Nomor hp',
                              labelStyle: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular((10))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextFormField(
                          controller: _passController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          obscureText: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: UnderlineInputBorder(),
                              labelText: 'Password',
                              labelStyle: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(
                      10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular((10))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: TextFormField(
                          controller: _passConController,
                          keyboardType: TextInputType.multiline,
                          maxLines: 1,
                          obscureText: true,
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(8),
                              border: UnderlineInputBorder(),
                              labelText: 'Konfirmasi Password',
                              labelStyle: TextStyle(fontSize: 12)),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        UserRegis? response = await Service.register(
                            _nameController.text,
                            _nomorController.text,
                            _passController.text,
                            _passConController.text);
                        if (_nameController.text.length == 0 ||
                            _nomorController.text.length < 11 ||
                            _passController.text.length < 5 ||
                            _passConController.text.length < 5) {
                          return showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: Text("Pandaftaran gagal"),
                                    content: Text(
                                        "Pastikan nomor Hp dan password yang anda masukan sesuai"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: ((context) {
                                              return Register();
                                            })));
                                          },
                                          child: Text("Ok"))
                                    ],
                                  ));
                        } else {
                          if (response != null) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text("Pandaftaran berhasil"),
                                      content: Text("kembali ke halaman login"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: ((context) {
                                                return LoginPage();
                                              })));
                                            },
                                            child: Text("Ok"))
                                      ],
                                    ));
                          } else {
                            print('Post data gagal');
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                      title: Text("Pandaftaran Gagal"),
                                      content: Text(response.toString()),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: ((context) {
                                                return Register();
                                              })));
                                            },
                                            child: Text("Ok"))
                                      ],
                                    ));
                          }
                        }
                      },
                      child: const Text("daftar Sekarang")),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: ScreenUtil().setHeight(20),
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    margin: const EdgeInsets.only(top: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sudah mempunyai akun?",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: ScreenUtil().setSp(10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const LoginPage();
                              }));
                            },
                            child: Text(
                              "Masuk Sekarang",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: ScreenUtil().setSp(12)),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
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
