import 'package:flutter/material.dart';

class DialogGagal extends StatelessWidget {
  const DialogGagal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text("Pandaftaran gagal"),
      content: Text("kembali ke halaman login"),
      // actions: [
      //   TextButton(
      //       onPressed: () {
      //         Navigator.push(context,
      //             MaterialPageRoute(
      //                 builder: ((context) {
      //           return LoginPage();
      //         })));
      //       },
      //       child: Text("Ok"))
      // ],
    );
  }
}
