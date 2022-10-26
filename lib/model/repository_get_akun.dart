import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:sampah_market/model/user_model.dart';
import 'package:sampah_market/screen/akun.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service {
  Future<List<User>> getAllUser() async {
    String? token;
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.getString("acces_token");
    //sharedPreferences.
    final response = await http.get(Uri.parse(
        "http://da39-2001-448a-6060-1b4a-e59d-3115-6532-6592.ngrok.io/api/auth/profile"),headers: {'Authorization' : 'Bearer $token'});
        if (response.statusCode == 200){
          List jsonResponse = jsonDecode(response.body);
          return jsonResponse.map((data) => User.fromJson(data)).toList();
        }else{
          throw Exception('failed to load data');
        }
  }
}
