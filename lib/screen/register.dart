import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/screen/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  ElevatedButton(
                      onPressed: () {}, child: const Text("daftar Sekarang")),
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
