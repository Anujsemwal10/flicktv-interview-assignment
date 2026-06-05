import 'package:anujsemwal/core/constants/app_dimensions.dart';
import 'package:anujsemwal/core/constants/colors.dart';
import 'package:flutter/material.dart';

class FeatureCard extends StatelessWidget {
  final String imageName;
  final String title;
  final String subtitle;
  final IconData iconData;

  const FeatureCard({
    super.key,
    required this.title,
    required this.imageName,
    required this.subtitle,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.d16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.d16),
        border: Border.all(color: AppColors.cardBorder),
        color: AppColors.cardBackground,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimensions.d10),
            child: Image.asset(
              imageName,
              height: AppDimensions.d60,
              width: AppDimensions.d60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppDimensions.d16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: AppDimensions.d16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppDimensions.d4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: AppDimensions.d13,
                    color: AppColors.textSecondary,
                    height: AppDimensions.d1Point3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
