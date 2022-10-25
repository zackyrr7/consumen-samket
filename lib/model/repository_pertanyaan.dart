import 'dart:convert';

import 'package:http/http.dart' as http;
import 'pertanyaan_model.dart';

class Service {
  Future<List<Pertanyaan>> getAllBarang() async {
    final response = await http.get(Uri.parse(
        "http://e995-182-1-167-39.ngrok.io/api/pertanyaan/"));
        if (response.statusCode == 200){
          List jsonResponse = jsonDecode(response.body);
          return jsonResponse.map((data) => Pertanyaan.fromJson(data)).toList();
        }else{
          throw Exception('failed to load data');
        }
  }
}
