import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:great_brands_assessment/core/constants/app_colors.dart';
import 'package:great_brands_assessment/core/constants/app_constants.dart';
import 'package:great_brands_assessment/core/constants/app_strings.dart';
import 'package:great_brands_assessment/core/constants/app_textstyles.dart';
import 'package:great_brands_assessment/core/extensions/navigation.dart';
import 'package:great_brands_assessment/core/extensions/widget_extensions.dart';
import 'package:great_brands_assessment/features/sign_up/state/sign_up_notifier.dart';
import 'package:great_brands_assessment/features/sign_up/ui/sign_up_success_page.dart';
import 'package:great_brands_assessment/widgets/page_widgets/app_scaffold.dart';
import 'package:great_brands_assessment/widgets/utility_widgets/app_text_field.dart';
import 'package:great_brands_assessment/widgets/utility_widgets/empty_app_bar.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppScaffold(
      appBar: EmptyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          15.sbH,
          Text(
            AppStrings.yourLegalName,
            style: AppTextStyles.h0(
              context,
            ).copyWith(color: AppColors.textBlack),
          ),
          15.sbH,
          Text(
            AppStrings.weNeedToAboutYou,
            style: AppTextStyles.h3(
              context,
            ).copyWith(fontWeight: FontWeight.w400),
          ),
          15.sbH,
          AppTextfield(
            horizontalPadding: 0,
            controller: ref.watch(signUpNotifier).firstNameController,
            hintText: AppStrings.firstName,
            hintStyle: AppTextStyles.h4HintText(context),
            style: AppTextStyles.h4Text(context),
            inputType: TextInputType.name,
            validator:
                (value) => ref
                    .watch(signUpNotifier.notifier)
                    .firstNameValidator(value),
          ),
          15.sbH,
          AppTextfield(
            horizontalPadding: 0,
            controller: ref.watch(signUpNotifier).lastNameController,
            hintText: AppStrings.lastName,
            hintStyle: AppTextStyles.h4HintText(context),
            style: AppTextStyles.h4Text(context),
            inputType: TextInputType.name,
            validator:
                (value) =>
                    ref.watch(signUpNotifier.notifier).lastNameValidator(value),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Opacity(
              opacity: ref.watch(signUpNotifier).enableNav ? 1.0 : 0.4,
              child: AbsorbPointer(
                absorbing: !ref.watch(signUpNotifier).enableNav,
                child: InkWell(
                  onTap: () => context.pushSuper(SignUpSuccessPage()),
                  child: Container(
                    padding: EdgeInsets.all(10.ar),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryPurple,
                    ),
                    child: Icon(
                      Icons.chevron_right,
                      color: AppColors.neutralWhite,
                      size: 40.ar,
                    ),
                  ),
                ),
              ),
            ),
          ),
          30.sbH,
        ],
      ),
    );
  }
}
