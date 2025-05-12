import 'package:flutter/material.dart';
import 'package:great_brands_assessment/core/storage/app_storage.dart';

class SignUpModel{
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final bool enableNav;

  const SignUpModel({
    required this.firstNameController,
    required this.lastNameController,
    this.enableNav = false,
});

  SignUpModel copyWith({
    TextEditingController? firstNameController,
    TextEditingController? lastNameController,
    AppStorage? storage,
    bool? enableNav,
}){
    return SignUpModel(
      firstNameController: firstNameController ?? this.firstNameController,
      lastNameController: lastNameController ?? this.lastNameController,
      enableNav: enableNav ?? this.enableNav,
    );
}
}