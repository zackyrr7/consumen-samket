import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sampah_market/constant.dart';
import 'package:sampah_market/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Akun extends StatefulWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  State<Akun> createState() => _AkunState();
}

late final SharedPreferences sharedPreferences;

class _AkunState extends State<Akun> {
  late TextEditingController controllernama;
  String? namaAkun = "Hazacky Azwat Ramadhan";
  String email = "Zackyrr7@gmail.com";
  String nomor = "089673626531";
  String alamat =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi a nibh at neque suscipit rhoncus. Nunc at massa lectus. Pellentesque porttitor purus id libero tincidunt.";
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
                    onPressed: () {
                      editnama();
                    },
                    child: const Text('Edit'))
              ],
            ));

    return Scaffold(
        appBar: AppBar(
          title: const Text("Akun"),
          actions: [
            GestureDetector(
              onTap: () {
                sharedPreferences.clear();
                sharedPreferences.commit();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => const LoginPage()),
                    (Route<dynamic> route) => false);
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: Text(
                  "Keluar",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.white,
                  child: const Text(
                    "Nama",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  //color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          namaAkun.toString(),
                          maxLines: 1,
                          style: const TextStyle(fontSize: 18),
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
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Nomor Telepon",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            nomor,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {}, child: const Icon(Icons.edit))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Password",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            password,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {}, child: const Icon(Icons.edit))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    "Alamat",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            alamat,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {}, child: const Icon(Icons.edit))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ])));
  }
//
//             //email
//             const Positioned(
//                 left: 30,
//                 top: 340,
//                 child: Text(
//                   "Email",
//                   style: TextStyle(fontSize: 13, color: Colors.grey),
//                 )),
//             Positioned(
//                 left: 50,
//                 top: 370,
//                 child: SizedBox(
//                   width: ScreenUtil().setWidth(300),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         child: Text(
//                           email,
//                           style: const TextStyle(fontSize: 15),
//                         ),
//                       ),
//                       GestureDetector(onTap: () {}, child: const Icon(Icons.edit))
//                     ],
//                   ),
//                 )),
//             //nomor telepon
//             const Positioned(
//                 left: 30,
//                 top: 410,
//                 child: Text(
//                   "Nomor Telepon",
//                   style: TextStyle(fontSize: 13, color: Colors.grey),
//                 )),
//             Positioned(
//                 left: 50,
//                 top: 440,
//                 child: SizedBox(
//                   width: ScreenUtil().setWidth(300),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         child: Text(
//                           nomor,
//                           style: const TextStyle(fontSize: 15),
//                         ),
//                       ),
//                       GestureDetector(onTap: () {}, child: const Icon(Icons.edit))
//                     ],
//                   ),
//                 )),
//             //alamat
//             const Positioned(
//                 left: 30,
//                 top: 480,
//                 child: Text(
//                   "Alamat",
//                   style: TextStyle(fontSize: 13, color: Colors.grey),
//                 )),
//             Positioned(
//                 left: 50,
//                 top: 510,
//                 child: SizedBox(
//                   width: ScreenUtil().setWidth(300),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                         child: Text(
//                           alamat,
//                           style: const TextStyle(fontSize: 15),
//                         ),
//                       ),
//                       GestureDetector(onTap: () {}, child: const Icon(Icons.edit))
//                     ],
//                   ),
//                 )),
  //password

}
