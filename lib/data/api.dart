import 'dart:convert';

import 'package:crypto/data/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://api.coindesk.com/v1/bpi/currentprice.json';
  final header = {
    'Content-Type': 'application/json',
    'accept': 'application/json'
  };

  Future<BitcoinPrice> getData() async {
    
    try {
      final response = await http.get(Uri.parse(baseUrl), headers: header);

      if (response.statusCode == 200) {
         return BitcoinPrice.fromJson(json.decode(response.body));
        
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle network or other exceptions
      throw Exception('Failed to load posts');
    }
  }
}
