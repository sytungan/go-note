import 'package:flutter/material.dart';

enum AppScreenSizes {
  small(300),
  normal(700),
  medium(1000),
  large(1400);

  const AppScreenSizes(this.maxPixel);
  final int maxPixel;
}

AppScreenSizes screenSize(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  for (var size in AppScreenSizes.values) {
    if (width < size.maxPixel) return size;
  }
  return AppScreenSizes.normal;
}
