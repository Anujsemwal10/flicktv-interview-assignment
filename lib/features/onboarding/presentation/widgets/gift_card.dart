import 'package:anujsemwal/core/constants/app_assets.dart';
import 'package:anujsemwal/core/constants/app_dimensions.dart';
import 'package:anujsemwal/core/constants/colors.dart';
import 'package:anujsemwal/core/constants/string_constants.dart';
import 'package:flutter/material.dart';

class GiftCard extends StatelessWidget {
  const GiftCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(AppDimensions.d12),
        color: AppColors.cardBorder,
      ),
      padding: EdgeInsets.all(AppDimensions.d10),
      child: Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.d12),
            child: Image.asset(
              AppAssets.gifCard,
              height: AppDimensions.d50,
              width: AppDimensions.d50,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: AppDimensions.d10),
          Expanded(
            child: Column(
              mainAxisSize: .min,
              crossAxisAlignment: .start,
              children: [
                Text(
                  StringConstants.claimGiftCard,
                  style: TextStyle(
                    fontSize: AppDimensions.d16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  StringConstants.claimGiftCardSubtitle,
                  style: TextStyle(
                    fontSize: AppDimensions.d12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: AppDimensions.d10),
          Transform.rotate(
            angle: AppDimensions.d3,
            child: Icon(
              Icons.arrow_back_ios,
              size: AppDimensions.d18,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
