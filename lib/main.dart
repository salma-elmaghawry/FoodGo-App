import 'package:flutter/material.dart';
import 'package:foodgo_app/Core/Theme/theme_cubit.dart';
import 'package:foodgo_app/Core/di/dependency_injection.dart';
import 'package:foodgo_app/foodgo_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();

  final themeCubit = ThemeCubit();
  await themeCubit.loadTheme();

  runApp(FoodGoApp(themeCubit: themeCubit));
}
