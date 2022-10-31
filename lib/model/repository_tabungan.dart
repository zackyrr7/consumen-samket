import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sampah_market/constant.dart';
import 'package:sampah_market/model/Tabungan_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service {
  Future<List<Tabungan>> getAllTabungan() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    final response = await http.get(Uri.parse("$url/tabungan/show"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      //List jsonResponse = new Map<String, dynamic>.from(jsonDecode(response.body));
      return jsonResponse.map((data) => Tabungan.fromJson(data)).toList() ;
    } else {
      throw Exception('failed to load data');
    }
  }
}
