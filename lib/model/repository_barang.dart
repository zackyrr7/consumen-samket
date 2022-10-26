import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sampah_market/model/barang_model.dart';

class Service {
  Future<List<Barang>> getAllBarang() async {
    final response = await http.get(Uri.parse(
        "http://da39-2001-448a-6060-1b4a-e59d-3115-6532-6592.ngrok.io/api/barang/"));
        if (response.statusCode == 200){
          List jsonResponse = jsonDecode(response.body);
          return jsonResponse.map((data) => Barang.fromJson(data)).toList();
        }else{
          throw Exception('failed to load data');
        }
  }
}
