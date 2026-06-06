import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/core/widgets/skeleton.dart';
import 'package:notify/features/theme/theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // only runs in debug mode and doesn't pollute release builds
    assert(() {
      debugPrint("Theme Mode: ${Theme.of(context).brightness}");
      return true;
    }());
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Skeleton(
      childWidget: Column(
        children: [
          ListTile(
            leading: Text("Account", style: textTheme.titleLarge),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_circle_rounded),
            ),
          ),
          Consumer(
            builder: (context, ref, child) {
              ref.watch(themeProvider);
              final isLight = Theme.of(context).brightness == Brightness.light;
              return ListTile(
                title: Text("Theme", style: textTheme.titleLarge),
                trailing: IconButton(
                  onPressed: () {
                    ref.read(themeProvider.notifier).toggle();
                  },
                  icon: Icon(isLight ? Icons.dark_mode : Icons.light_mode),
                ),
              );
            },
          ),
          ListTile(
            title: Text("Sign Out", style: textTheme.titleLarge),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.output_outlined),
            ),
          ),
          SizedBox(height: 20.h),
          SizedBox(
            width: 358.w,
            height: 50.h,
            child: ElevatedButton(onPressed: () {}, child: Text("Get Started")),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Settings"),
        // backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
