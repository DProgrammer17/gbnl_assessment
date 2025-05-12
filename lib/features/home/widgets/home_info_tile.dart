import 'package:flutter/material.dart';
import 'package:great_brands_assessment/core/constants/app_colors.dart';
import 'package:great_brands_assessment/core/constants/app_constants.dart';
import 'package:great_brands_assessment/core/constants/app_textstyles.dart';
import 'package:great_brands_assessment/core/extensions/widget_extensions.dart';

class HomeInfoTile extends StatelessWidget {
  final String networkImage;
  final String publisher;
  final String date;
  final String info;
  const HomeInfoTile({
    super.key,
    required this.networkImage,
    required this.publisher,
    required this.date,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.ah),
      child: Row(
        children: [
          Image.network(
            networkImage,
            height: 100.ah,
            width: 100.aw,
            fit: BoxFit.cover,
          ),
          16.sbW,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    publisher.toUpperCase(),
                    style: AppTextStyles.body3Regular(
                      context,
                    ).copyWith(color: AppColors.textSubGrey),
                  ),
                 80.sbW,
                  Text(
                    date.toUpperCase(),
                    style: AppTextStyles.body3Regular(
                      context,
                    ).copyWith(color: AppColors.textSubGrey),
                  ),
                ],
              ),
              8.sbH,
              SizedBox(
                width: 210.aw,
                child: Text(info, style: AppTextStyles.h4InfoText(context)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
