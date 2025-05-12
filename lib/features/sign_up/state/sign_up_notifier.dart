import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:great_brands_assessment/core/constants/app_strings.dart';
import 'package:great_brands_assessment/core/extensions/navigation.dart';
import 'package:great_brands_assessment/core/storage/app_storage.dart';
import 'package:great_brands_assessment/features/home/ui/home_page.dart';
import 'package:great_brands_assessment/features/sign_up/state/sign_up_model.dart';
import 'package:permission_handler/permission_handler.dart';

final signUpNotifier = NotifierProvider<SignUpNotifier, SignUpModel>(
  () => SignUpNotifier(),
);

class SignUpNotifier extends Notifier<SignUpModel> {
  @override
  SignUpModel build() => SignUpModel(
    firstNameController: TextEditingController(),
    lastNameController: TextEditingController(),
  );

  String? firstNameValidator(String? value) {
    if (value != null && (value.isEmpty || value.length < 2)) {
      return ErrorStrings.firstNameEmpty;
    }
    signUpNav();
    return null;
  }

  String? lastNameValidator(String? value) {
    if (value != null && (value.isEmpty || value.length < 2)) {
      return ErrorStrings.lastNameEmpty;
    }
    signUpNav();
    return null;
  }

  void signUpNav() {
    if (state.firstNameController.text.isEmpty &&
        state.lastNameController.text.isEmpty) {
      Future.microtask(() => state = state.copyWith(enableNav: false));
      return;
    }
    Future.microtask(() => state = state.copyWith(enableNav: true));
  }

  void requestNotificationPermission(BuildContext context) async {
    AppStorage storage = AppStorage();
    await storage.initPreferences();

    var status = await Permission.notification.status;
    if (status.isDenied) {
      await Permission.notification.request();
      if (context.mounted) {
        storage.setStringPrefs(
          key: AppStrings.firstNameKey,
          value: state.firstNameController.text,
        );
        context.pushSuper(HomePage());
      }
      return;
    }
    if (status.isGranted || status.isProvisional) {
      if (context.mounted) {
        storage.setStringPrefs(
          key: AppStrings.firstNameKey,
          value: state.firstNameController.text,
        );
        context.pushSuper(HomePage());
      }
      return;
    }

    if (status.isRestricted || status.isPermanentlyDenied) {
      await openAppSettings();
      return;
    }
  }
}
