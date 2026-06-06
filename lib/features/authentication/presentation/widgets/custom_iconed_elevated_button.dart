import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconElevatedButton extends StatelessWidget {
  final Function()? onPressed;
  final FaIconData icon;
  final String buttonText;
  const IconElevatedButton({
    super.key,
    this.onPressed,
    required this.icon,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: isDark ? Colors.black : const Color(0xFFF9007D),
        alignment: Alignment.centerLeft, // aligns icon+text consistently
      ),
      onPressed: onPressed,
      icon: FaIcon(icon, size: 24.w),
      label: Align(
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: textTheme.titleLarge!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
