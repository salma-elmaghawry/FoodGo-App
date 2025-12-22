import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveUtils {
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width > 600;
  }
  
  static bool isSmallPhone(BuildContext context) {
    return MediaQuery.of(context).size.width < 375;
  }
  
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }
  
  // Responsive padding
  static EdgeInsets screenPadding() {
    return EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h);
  }
  
  // Adaptive column count for grids
  static int getGridColumns(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return 4;
    if (width > 800) return 3;
    if (width > 600) return 2;
    return 2;
  }
}