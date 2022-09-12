import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/constant.dart';

class Akun extends StatefulWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  late TextEditingController controllernama;
String? namaAkun = "Hazacky Azwat Ramadhan";
    String email = "Zackyrr7@gmail.com";
    String nomor = "089673626531";
    String alamat = "Tanray 2";
    String password = "********";
  @override
  void initState() {
    super.initState();
    controllernama = TextEditingController();
  }


  @override 
  void dispose() {
    controllernama.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    

    void editnama() {
      Navigator.of(context).pop(controllernama.text);

      controllernama.clear();
    }

    Future<String?> openDialogName() => showDialog<String?>(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Username"),
              content: TextField(
                autofocus: true,
                controller: controllernama,
              ),
              actions: [
                TextButton(
                    onPressed: ()  {
                     editnama();
                    },
                    child: const Text('Edit'))
              ],
            ));

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 80,
              left: 15,
              child: Container(
                height: ScreenUtil().setHeight(150),
                width: ScreenUtil().setWidth(330),
                decoration: BoxDecoration(
                    color: biruMain, borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person,
                      size: 100,
                    ),
                    Flexible(
                      child: Text(
                        namaAkun.toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )),
          const Positioned(
              left: 30,
              top: 270,
              child: Text(
                "username",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              )),
          Positioned(
              left: 50,
              top: 300,
              child: SizedBox(
                width: ScreenUtil().setWidth(300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        namaAkun.toString(),
                        maxLines: 1,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    GestureDetector(
                        onTap: () async {
                     final namaAkun = await openDialogName();
                      if (namaAkun == null || namaAkun.isEmpty) return;

                      setState(() => this.namaAkun = namaAkun);
                    },
                        child: const Icon(Icons.edit))
                  ],
                ),
              )),
          //email
          const Positioned(
              left: 30,
              top: 340,
              child: Text(
                "Email",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              )),
          Positioned(
              left: 50,
              top: 370,
              child: SizedBox(
                width: ScreenUtil().setWidth(300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        email,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    GestureDetector(onTap: () {}, child: const Icon(Icons.edit))
                  ],
                ),
              )),
          //nomor telepon
          const Positioned(
              left: 30,
              top: 410,
              child: Text(
                "Nomor Telepon",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              )),
          Positioned(
              left: 50,
              top: 440,
              child: SizedBox(
                width: ScreenUtil().setWidth(300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        nomor,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    GestureDetector(onTap: () {}, child: const Icon(Icons.edit))
                  ],
                ),
              )),
          //alamat
          const Positioned(
              left: 30,
              top: 480,
              child: Text(
                "Alamat",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              )),
          Positioned(
              left: 50,
              top: 510,
              child: SizedBox(
                width: ScreenUtil().setWidth(300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        alamat,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    GestureDetector(onTap: () {}, child: const Icon(Icons.edit))
                  ],
                ),
              )),
          //password
          const Positioned(
              left: 30,
              top: 550,
              child: Text(
                "Password",
                style: TextStyle(fontSize: 13, color: Colors.grey),
              )),
          Positioned(
              left: 50,
              top: 580,
              child: SizedBox(
                width: ScreenUtil().setWidth(300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        password,
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                    GestureDetector(onTap: () {}, child: const Icon(Icons.edit))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
