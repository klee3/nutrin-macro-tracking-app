import 'dart:convert';
import 'dart:io';

import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;
import 'package:http/http.dart' as http;
import 'package:mobileapp/model/tracked_food.dart';

class FoodClient {
  final url =
      "https://api.nal.usda.gov/fdc/v1/foods/list?api_key=OwOopadFaacSp65Vps9UTkNTWlVUXOFFMOy6jgsf";
  var apiKey;

  init() {
    load();
    apiKey = env.containsKey('APIKEY') ? env['APIKEY'] : Error();
  }

  Future<http.Response> foodQueryForId(String food) async {
    var body = jsonEncode({
      "query": food,
      "dataType": ["Foundation", "SR Legacy"],
      "pageSize": 10,
      "pageNumber": 1,
      "sortBy": "dataType.keyword",
      "sortOrder": "asc"
    });
    var header = {'Content-Type': 'application/json'};
    var response = http
        .post(url, body: body, headers: header)
        .then((value) => print(value.body));
    return await http.post(url, body: body, headers: header);
  }

  Future<http.Response> foodQueryWithId(Future<http.Response> response) {}
}
