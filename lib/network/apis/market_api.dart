import 'dart:convert';

import 'package:great_brands_assessment/network/response/market_news_response.dart';
import 'package:great_brands_assessment/network/utils/api_header.dart';
import 'package:great_brands_assessment/network/utils/endpoints.dart';
import 'package:http/http.dart' as http;

class MarketApi {
  var client = http.Client();
  Future<NewsResponse?> fetchNews() async {
    final response = await client.get(
      Uri.parse(Endpoints.marketNews),
      headers: ApiHeader.apiHeader,
    );

    if (response.statusCode == 200) {
      return NewsResponse.fromJson(json.decode(response.body));
    }

    throw Exception(response.toString());
  }
}
