import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markatty/Core/Theme/app_colors.dart';

class AppTextStyles {
  static TextStyle poppins24Bold({Color? color, double? fontSize}) {
    return GoogleFonts.poppins(
      fontSize: fontSize?.sp ?? 24.sp,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle poppins16Regular({Color? color, double? fontSize}) {
    return GoogleFonts.poppins(
      fontSize: fontSize?.sp ?? 16.sp,
      fontWeight: FontWeight.normal,
      color: color,
    );
  }
}
