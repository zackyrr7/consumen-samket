import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EWallet extends StatefulWidget {
  const EWallet({Key? key}) : super(key: key);

  @override
  State<EWallet> createState() => _EWalletState();
}

class _EWalletState extends State<EWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "Form E-Wallet",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )),

            //jenis sampah
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((10))),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: TextField(
                    //keyboardType: TextInputType.number,
                    maxLines: null,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: UnderlineInputBorder(),
                        labelText: 'Jenis E-Wallet yang di Ingikan',
                        labelStyle: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
            ),
            //nama
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((10))),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: UnderlineInputBorder(),
                        labelText: 'Nama',
                        labelStyle: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
            ),

            //nomor
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((10))),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: TextField(
                   // keyboardType: TextInputType.phone,
                    maxLines: null,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: UnderlineInputBorder(),
                        labelText: 'Nomor E-wallet',
                        labelStyle: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
            ),

             Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((10))),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    maxLines: null,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: UnderlineInputBorder(),
                        labelText: 'Nominal yang di inginkan',
                        labelStyle: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((10))),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    maxLines: null,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(8),
                        border: UnderlineInputBorder(),
                        labelText: 'Nomor handphone anda',
                        labelStyle: TextStyle(fontSize: 12)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text("Buat Transaksi")),

            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: ScreenUtil().setHeight(250),
                width: ScreenUtil().setWidth(300),
                child: Column(
                  children: [
                    Text("Catatan",
                        style: TextStyle(fontSize: ScreenUtil().setSp(20))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Setelah membuat transaksi penukaran saldo berupa penukaran E-Wallet, Pihak dari Sampah Market akan melakukan pengecekan terkait saldo anda. E-wallet yang tersedia berupa \nShopeePay\nDana\nGopay\nPihak admin akan melakukan konfirmasi kepada anda. Terima Kasih",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                      ),
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
