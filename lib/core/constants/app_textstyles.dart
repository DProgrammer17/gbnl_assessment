import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:great_brands_assessment/core/constants/app_colors.dart';
import 'package:great_brands_assessment/core/constants/app_constants.dart';
import 'package:great_brands_assessment/widgets/utility_widgets/layout_helper.dart';

abstract class AppTextStyles {
  static TextStyle h0(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    color: AppColors.textGrey,
    fontSize: context.isMobile ? 30.asp : 16.asp,
  );

  static TextStyle h1(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    color: AppColors.textGrey,
    fontSize: context.isMobile ? 28.asp : 14.asp,
  );

  static TextStyle h2(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    color: AppColors.textGrey,
    fontSize: 14.asp,
  );

  static TextStyle h3(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    color: AppColors.textGrey,
    fontSize: 16.asp,
  );

  static TextStyle h3Text(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w500,
    color: AppColors.textGrey,
    fontSize: 16.asp,
  );

  static TextStyle h4(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    color: AppColors.textGrey,
    fontSize: 20.asp,
  );

  static TextStyle h4InfoText(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
    fontSize: 20.asp,
  );

  static TextStyle h4HintText(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    color: AppColors.textSubGrey,
    fontSize: 18.asp,
  );

  static TextStyle h4Text(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    color: AppColors.textBlack,
    fontSize: 18.asp,
  );

  static TextStyle h5(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    color: AppColors.textGrey,
    fontSize: 18.asp,
  );

  static TextStyle body1Regular(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    color: AppColors.textGrey,
    fontSize: context.isMobile ? 12.asp : 8.asp,
  );

  static TextStyle body2Regular(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    color: AppColors.textGrey,
    fontSize: context.isMobile ? 14.asp : 8.asp,
  );

  static TextStyle body3Regular(BuildContext context) => GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    color: AppColors.textGrey,
    fontSize: 10.asp,
  );
}
