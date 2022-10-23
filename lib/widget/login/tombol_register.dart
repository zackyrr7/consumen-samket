import 'package:flutter/material.dart';

class TombolRegister extends StatelessWidget {
  const TombolRegister({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      margin: const EdgeInsets.only(top: 5.0),
      child: Row(
        children: [
          const Text(
            "Belum mempunyai akun?",
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                "Daftar Sekarang",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          )
        ],
      ),
    );
  }
}
