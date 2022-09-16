import 'package:flutter/material.dart';

import 'package:sampah_market/widget/rincian%20point/banyak_point.dart';
import 'package:sampah_market/widget/rincian%20point/rincian_list.dart';

class RincianPoint extends StatelessWidget {
  const RincianPoint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rincian Point"),
      ),
      body: Column(
        children: const [
          RincianBanyakPoint(),

          //List
          RincianList()
        ],
      ),
    );
  }
}

