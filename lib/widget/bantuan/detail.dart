import 'package:flutter/material.dart';
import 'package:sampah_market/list_tanya.dart';

class Detail extends StatelessWidget {
  final Tanya tanya;

  // ignore: use_key_in_widget_constructors
  const Detail(this.tanya);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text(tanya.judul),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 50, 8, 0),
              child: Text(tanya.jawab,textAlign: TextAlign.justify,),
            )
          ],
        ),
      ),
    );
  }
}
