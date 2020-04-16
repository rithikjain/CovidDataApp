import 'dart:convert';

import 'package:covid_data/data/models/covid_data.dart';
import 'package:http/http.dart' as http;

class AppRepo {
  Future<Global> getGlobalData() async {
    var response = await http.get("https://api.covid19api.com/summary");
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Global globalData = CovidData.fromJson(data).global;
      return globalData;
    } else {
      throw Exception();
    }
  }
}