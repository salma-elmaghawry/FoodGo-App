import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  static const _key = 'themeMode';

  ThemeCubit() : super(ThemeMode.system);

  /// Call this once at startup to restore the saved preference.
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getString(_key);
    if (saved == 'dark') {
      emit(ThemeMode.dark);
    } else if (saved == 'light') {
      emit(ThemeMode.light);
    } else {
      emit(ThemeMode.system);
    }
  }

  Future<void> setTheme(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, mode.name);
    emit(mode);
  }

  Future<void> toggleTheme() async {
    final next = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    await setTheme(next);
  }

  bool get isDark => state == ThemeMode.dark;
}
