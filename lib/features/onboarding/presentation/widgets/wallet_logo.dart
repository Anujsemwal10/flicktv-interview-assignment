import 'package:anujsemwal/core/constants/app_dimensions.dart';
import 'package:anujsemwal/core/constants/colors.dart';
import 'package:flutter/material.dart';

class WalletLogo extends StatelessWidget {
  final bool isVisible;

  const WalletLogo({super.key, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      curve: Curves.fastOutSlowIn,
      opacity: isVisible ? AppDimensions.d1 : AppDimensions.d0,
      duration: const Duration(milliseconds: AppDimensions.int300),
      child: Icon(
        Icons.wallet,
        size: AppDimensions.d80,
        color: AppColors.accentYellow,
      ),
    );
  }
}
