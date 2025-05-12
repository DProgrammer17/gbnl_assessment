import 'package:flutter/material.dart';
import 'package:great_brands_assessment/core/constants/app_assets.dart';
import 'package:great_brands_assessment/core/constants/app_colors.dart';
import 'package:great_brands_assessment/core/constants/app_constants.dart';
import 'package:great_brands_assessment/core/extensions/navigation.dart';
import 'package:great_brands_assessment/core/storage/app_storage.dart';
import 'package:great_brands_assessment/features/sign_up/ui/sign_up_page.dart';
import 'package:great_brands_assessment/widgets/page_widgets/app_scaffold.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 800),
      () => context.pushSuper(SignUpPage()),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: Colors.black,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset(AppAssets.logo, height: 188.ah, width: 188.aw),
      ),
    );
  }
}
