import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/core/constants/routes_config.dart';
import 'package:notify/core/theme/app_theme.dart';
import 'package:notify/features/theme/theme_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: false,
      builder: (context, child) {
        // ✅ build once here — ScreenUtil is fully ready at this point
        final lightTheme = AppTheme.lightTheme;
        final darkTheme = AppTheme.darkTheme;
        return Consumer(
          builder: (context, ref, child) {
            final router = ref.watch(
              routerProvider,
            ); // watch the provider named routerConfig
            final themeAsync = ref.watch(themeProvider);
            return MaterialApp.router(
              routerConfig: router,
              debugShowCheckedModeBanner: false,
              title: 'Notify',
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: themeAsync.asData?.value ?? ThemeMode.system,
              // add this 👇
              builder: (context, child) {
                if (themeAsync.isLoading) {
                  return const Scaffold(body: SizedBox.shrink());
                }
                return child ?? const SizedBox.shrink();
              },
            );
          },
        );
      },
    );
  }
}
