import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sample_flutter/models/country.dart';

class Webservice {

  Future<List<Country>> fetchCountries(String keyword) async {
    final url = "https://restcountries.eu/rest/v2/all";
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final body = jsonDecode(response.body);
      List<Country> list = List<Country>.from(body.map((i) => Country.fromJson(i)));
      return list;
    } else {
      throw Exception("Unable to perform request!");
    }
  }

}