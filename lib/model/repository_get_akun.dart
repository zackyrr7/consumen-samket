import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sampah_market/constant.dart';

import 'package:sampah_market/model/user_model.dart';
import 'package:sampah_market/screen/akun.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service {
  Future<List<User>> getAllUser() async {
    //String token = await SharedPreferences.getInstance()
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");

    final response = await http.get(Uri.parse("$url/auth/profile"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => User.fromJson(data)).toList();
    } else {
      throw Exception('failed to load data');
    }
  }
}
