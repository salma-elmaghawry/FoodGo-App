import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:foodgo_app/Config/Routes/app_router.dart';
import 'package:foodgo_app/Config/Routes/routes.dart';
import 'package:foodgo_app/Core/Theme/app_theme.dart';
import 'package:foodgo_app/Core/Theme/theme_cubit.dart';

class FoodGoApp extends StatelessWidget {
  final ThemeCubit themeCubit;
  const FoodGoApp({super.key, required this.themeCubit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: themeCubit,
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return ScreenUtilInit(
            designSize: const Size(430, 930),
            minTextAdapt: true,
            child: MaterialApp(
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: themeMode,
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouter().generateRoute,
              initialRoute: Routes.splash,
              onUnknownRoute: (settings) {
                return MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(title: const Text('Route Not Found')),
                    body: const Center(child: Text('Page not found')),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
