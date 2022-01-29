import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkHelper {
  String url = 'https://rest.coinapi.io/v1/exchangerate';
  String APIkey = dotenv.env['API_URL'];
  final List<String> cryptoList = [
    'BTC',
    'ETH',
    'LTC',
  ];
  final rates = [];

  dynamic getCoinData(curr) async {
    for (String coin in cryptoList) {
      var url = Uri.parse('${this.url}/$coin/$curr?apikey=$APIkey');
      http.Response response = await http.get(url);
      if (response.statusCode != 200) return null;
      double rate = jsonDecode(response.body)['rate'];
      rates.add(rate.toStringAsFixed(2));
    }
    return rates;
  }
}
