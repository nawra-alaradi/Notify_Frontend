import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:notify/core/constants/app_constants.dart';
import 'package:notify/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeDataSource {
  final SharedPreferences sharedPreferences;
  ThemeDataSource({required this.sharedPreferences});

  Future<Unit> cacheTheme({required ThemeMode themeMode}) {
    sharedPreferences.setString(
      kThemeKey,
      (themeMode == ThemeMode.dark ? kDark : kLight),
    );
    return Future.value(unit);
  }

  Future<ThemeMode> getCachedTheme() {
    // TODO: implement getCachedTheme
    final cachedTheme = sharedPreferences.getString(kThemeKey);
    if (cachedTheme != null) {
      ThemeMode themeEnum = (cachedTheme == kDark
          ? ThemeMode.dark
          : ThemeMode.light);
      return Future.value(themeEnum);
    } else {
      throw const EmptyCacheException(message: "Theme Not Cached");
    }
  }
}
