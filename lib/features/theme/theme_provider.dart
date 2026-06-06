// shared/providers/theme_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notify/core/errors/exceptions.dart';
import 'package:notify/core/providers/shared_providers.dart';
import 'package:notify/features/theme/theme_service.dart';

final themeProvider = AsyncNotifierProvider<ThemeNotifier, ThemeMode>(() {
  return ThemeNotifier();
});

class ThemeNotifier extends AsyncNotifier<ThemeMode> {
  // runs once on startup — loads saved theme
  @override
  Future<ThemeMode> build() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    final dataSource = ThemeDataSource(sharedPreferences: prefs);

    // // detect device brightness as fallback
    // final brightness = PlatformDispatcher.instance.platformBrightness;
    // final deviceDefault = brightness == Brightness.dark
    //     ? ThemeMode.dark
    //     : ThemeMode.light;

    try {
      return await dataSource.getCachedTheme();
    } on EmptyCacheException {
      return ThemeMode.system; // default
    }
  }

  // saves + updates state
  Future<void> setTheme(ThemeMode mode) async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final dataSource = ThemeDataSource(sharedPreferences: prefs);
    await dataSource.cacheTheme(themeMode: mode);
    state = AsyncData(mode);
  }

  // flips current theme
  Future<void> toggle() async {
    final current = state.asData?.value ?? ThemeMode.light;
    final newMode = current == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;
    await setTheme(newMode);
  }
}
