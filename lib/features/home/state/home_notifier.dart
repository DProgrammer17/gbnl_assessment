import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:great_brands_assessment/core/constants/app_strings.dart';
import 'package:great_brands_assessment/core/storage/app_storage.dart';
import 'package:great_brands_assessment/features/home/state/home_model.dart';
import 'package:great_brands_assessment/network/apis/market_api.dart';
import 'package:great_brands_assessment/widgets/utility_widgets/app_toast.dart';

final homeNotifier = NotifierProvider<HomeNotifier, HomeModel>(
  () => HomeNotifier(),
);

class HomeNotifier extends Notifier<HomeModel> {
  @override
  build() => HomeModel(storage: AppStorage());

  void initStorage() async{
    await state.storage.initPreferences();
    state = state.copyWith(
      userName: state.storage.getStringPref(AppStrings.firstNameKey),
    );
  }

  void getNews(BuildContext context) async {
    state = state.copyWith(loading: true);
    final res = await MarketApi().fetchNews();
    state = state.copyWith(loading: false);

    if (res != null && res.response.isNotEmpty) {
      state = state.copyWith(news: res.response);
      if (context.mounted) {
        AppMessages.showSuccessMessage(
          context: context,
          message: AppStrings.newsGotten,
        );
      }
      return;
    }

    state = state.copyWith(error: true);
    if (context.mounted) {
      AppMessages.showErrorMessage(
        context: context,
        message: ErrorStrings.somethingWentWrong,
      );
    }
  }
}
