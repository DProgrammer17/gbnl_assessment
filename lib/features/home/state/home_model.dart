import 'package:great_brands_assessment/core/storage/app_storage.dart';
import 'package:great_brands_assessment/network/response/market_news_response.dart';

class HomeModel {
  final AppStorage storage;
  final String userName;
  final List<MarketNewsResponse> news;
  final bool loading;
  final bool error;

  const HomeModel({
    required this.storage,
    this.news = const [],
    this.userName = '',
    this.loading = false,
    this.error = false,
  });

  HomeModel copyWith({
    List<MarketNewsResponse>? news,
    String? userName,
    AppStorage? storage,
    bool? loading,
    bool? error,
  }) {
    return HomeModel(
      news: news ?? this.news,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      userName: userName ?? this.userName,
      storage: storage ?? this.storage,
    );
  }
}
