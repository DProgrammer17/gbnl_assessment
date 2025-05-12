import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:great_brands_assessment/core/constants/app_colors.dart';
import 'package:great_brands_assessment/core/constants/app_constants.dart';
import 'package:great_brands_assessment/core/constants/app_strings.dart';
import 'package:great_brands_assessment/core/constants/app_textstyles.dart';
import 'package:great_brands_assessment/core/extensions/date_time_extension.dart';
import 'package:great_brands_assessment/core/extensions/widget_extensions.dart';
import 'package:great_brands_assessment/core/storage/app_storage.dart';
import 'package:great_brands_assessment/features/home/state/home_notifier.dart';
import 'package:great_brands_assessment/features/home/widgets/home_info_tile.dart';
import 'package:great_brands_assessment/features/sign_up/state/sign_up_notifier.dart';
import 'package:great_brands_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:great_brands_assessment/widgets/utility_widgets/empty_app_bar.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final storage = AppStorage();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeNotifier.notifier).initStorage();
      ref.read(homeNotifier.notifier).getNews(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (value, _) => false,
      child: AppScaffold(
        appBar: EmptyAppBar(appBarColor: Colors.transparent),
        padding: EdgeInsets.zero,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: AppConstants.deviceHeight * 0.2435,
                  color: AppColors.darkPurple,
                ),
                Container(
                  height: AppConstants.deviceHeight * 0.7,
                  color: Colors.black,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.aw),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  20.sbH,
                  Text(
                    AppStrings.heyFirstName(
                      ref
                          .watch(homeNotifier)
                          .userName,
                    ),
                    style: AppTextStyles.h0(
                      context,
                    ).copyWith(color: AppColors.textWhite),
                  ),
                  22.sbH,
                  Builder(
                    builder: (_) {
                      if (ref.watch(homeNotifier).loading) {
                        return Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primaryPurple,
                          ),
                        );
                      }

                      if (ref.watch(homeNotifier).error) {
                        return Text(
                          ErrorStrings.somethingWentWrong,
                          style: AppTextStyles.h3Text(
                            context,
                          ).copyWith(color: AppColors.textWhite),
                        );
                      }
                      return Expanded(
                        child: ListView(
                          children: List.generate(
                            ref.watch(homeNotifier).news.length,
                            (index) => HomeInfoTile(
                              networkImage:
                                  ref
                                      .watch(homeNotifier)
                                      .news
                                      .elementAt(index)
                                      .image ??
                                  '',
                              publisher:
                                  ref
                                      .watch(homeNotifier)
                                      .news
                                      .elementAt(index)
                                      .source ??
                                  '',
                              date:
                                  ref
                                      .watch(homeNotifier)
                                      .news
                                      .elementAt(index)
                                      .datetime!
                                      .dateString(),
                              info:
                                  ref
                                      .watch(homeNotifier)
                                      .news
                                      .elementAt(index)
                                      .headline ??
                                  '',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
