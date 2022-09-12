import 'package:flutter/material.dart';
import 'package:sampah_market/demo.dart';

class Detail extends StatelessWidget {
  const Detail(Map<String, dynamic> dataTanya, {Key? key, required this.judul, required this.jawaban})
      : super(key: key);

  final String judul, jawaban;

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: const Text("asdas"),
    );
  }
}
