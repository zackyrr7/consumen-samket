import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sampah_market/model/repository_get_akun.dart';
import 'package:sampah_market/model/user_model.dart';
import 'package:sampah_market/screen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Akun extends StatefulWidget {
  const Akun({Key? key}) : super(key: key);

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  late SharedPreferences sharedPreferences;
  Service serviceApi = Service();
  late Future<User> listUser;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    //listUser = serviceApi.getAllUser();
    listUser = serviceApi.getAllUser();
    checkLoginStatus();
    controllernama = TextEditingController();
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

  late TextEditingController controllernama;
  String? namaAkun = "Hazacky Azwat Ramadhan";
  String email = "Zackyrr7@gmail.com";
  String nomor = "089673626531";
  String alamat =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi a nibh at neque suscipit rhoncus. Nunc at massa lectus. Pellentesque porttitor purus id libero tincidunt.";
  String password = "********";
  // @override
  // void initState() {
  //   super.initState();

  // }

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
                //sharedPreferences.commit();
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
        body: FutureBuilder<User>(
          future: listUser,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              User isiUser = snapshot.data!;
              return SingleChildScrollView(
                  child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        //color: Colors.white,
                        child: const Text(
                          "Nama",
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: SizedBox(
                        //color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                isiUser.name,
                                maxLines: 1,
                                style:
                                    TextStyle(fontSize: ScreenUtil().setSp(18)),
                              ),
                            ),
                            GestureDetector(
                                onTap: () async {
                                  final namaAkun = await openDialogName();
                                  if (namaAkun == null || namaAkun.isEmpty)
                                    return;

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
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(18)),
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
                                child: Text(alamat,
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(18))),
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
              ]));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return const Center(child: CircularProgressIndicator());
          }),
        ));
  }
}
