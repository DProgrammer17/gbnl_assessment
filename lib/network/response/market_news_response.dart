import 'dart:convert';

List<MarketNewsResponse> marketNewsResponseFromJson(String str) => List<MarketNewsResponse>.from(json.decode(str).map((x) => MarketNewsResponse.fromJson(x)));

class NewsResponse{
final List<MarketNewsResponse> response;

NewsResponse({
  this.response = const [],
});

factory NewsResponse.fromJson(dynamic json) => NewsResponse(
  response: List<MarketNewsResponse>.from(json.map((x) => MarketNewsResponse.fromJson(x))),
);

}

class MarketNewsResponse {
  final String? category;
  final int? datetime;
  final String? headline;
  final int? id;
  final String? image;
  final String? related;
  final String? source;
  final String? summary;
  final String? url;

  MarketNewsResponse({
    this.category,
    this.datetime,
    this.headline,
    this.id,
    this.image,
    this.related,
    this.source,
    this.summary,
    this.url,
  });

  factory MarketNewsResponse.fromJson(Map<String, dynamic> json) => MarketNewsResponse(
    category: json["category"],
    datetime: json["datetime"],
    headline: json["headline"],
    id: json["id"],
    image: json["image"],
    related: json["related"],
    source: json["source"],
    summary: json["summary"],
    url: json["url"],
  );
}
