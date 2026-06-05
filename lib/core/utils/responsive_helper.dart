import 'package:anujsemwal/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

extension ResponsiveContext on BuildContext {
  ///Base Height Benchmark
  double get _baseHeight => AppDimensions.d922;

  /// To get screen current height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// To get screen current width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// RESPONSIVE MULTIPLIER METHOD
  double responsiveHeight(double multiplier) {
    return multiplier * (screenHeight / _baseHeight);
  }
}
