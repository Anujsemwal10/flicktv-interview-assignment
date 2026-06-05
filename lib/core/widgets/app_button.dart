import 'package:anujsemwal/core/constants/app_dimensions.dart';
import 'package:anujsemwal/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color buttonColor;
  final Color? textColor;
  final String buttonText;
  final Function()? onTap;

  const AppButton({
    super.key,
    required this.buttonColor,
    required this.buttonText,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadiusGeometry.circular(AppDimensions.d12),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: AppDimensions.d10,
          vertical: AppDimensions.d15,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: AppDimensions.d18,
              fontWeight: FontWeight.w500,
              color: textColor ?? AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
