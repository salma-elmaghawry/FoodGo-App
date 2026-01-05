import 'package:flutter/material.dart';
import 'package:foodgo_app/Core/di/dependency_injection.dart';
import 'package:foodgo_app/foodgo_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  runApp(const FoodGoApp());
}
