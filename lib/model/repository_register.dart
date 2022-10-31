import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sampah_market/constant.dart';
import 'package:sampah_market/model/register_model.dart';
import 'package:sampah_market/model/user_model.dart';

class Service {
  static Future<UserRegis?> register(String name, String nomor_hp,
      String password, String password_confirmation) async {
    //try{
    final response = await http.post(Uri.parse("$url/auth/register/"), body: {
      "name": name,
      "nomor_hp": nomor_hp,
      "password": password,
      "password_confirmation": password_confirmation,
    });
    if (response.statusCode == 201) {
      String responseString = response.body;
      print(responseString);
    } else {
      String error = response.body;
      print(error);
    }
    return null;
    
  }
}
