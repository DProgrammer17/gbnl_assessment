import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:great_brands_assessment/core/constants/app_assets.dart';
import 'package:great_brands_assessment/core/constants/app_constants.dart';
import 'package:great_brands_assessment/core/constants/app_strings.dart';
import 'package:great_brands_assessment/core/constants/app_textstyles.dart';
import 'package:great_brands_assessment/core/extensions/widget_extensions.dart';
import 'package:great_brands_assessment/features/sign_up/state/sign_up_notifier.dart';
import 'package:great_brands_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:great_brands_assessment/widgets/utility_widgets/app_button.dart';
import 'package:great_brands_assessment/widgets/utility_widgets/empty_app_bar.dart';

class SignUpSuccessPage extends ConsumerWidget {
  const SignUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: EmptyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          80.sbH,
          Column(
            children: [
              Image.asset(AppAssets.messageImage, height: 98.ah),
              8.sbH,
              Text(
                AppStrings.getTheMostOutBlott,
                style: AppTextStyles.h0(context).copyWith(fontSize: 24.asp),
              ),
              12.sbH,
              Text(
                AppStrings.allowNotificationStayInLoop,
                textAlign: TextAlign.center,
                style: AppTextStyles.h4HintText(
                  context,
                ).copyWith(fontSize: 16.asp),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30.ah),
            child: AppButton(
              onTap:
                  () => ref
                      .watch(signUpNotifier.notifier)
                      .requestNotificationPermission(context),
              title: AppStrings.continueText,
            ),
          ),
        ],
      ),
    );
  }
}
