import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Widget? childWidget;
  final bool isButtonRequired;
  final EdgeInsets padding;
  final Widget? button;
  const OnboardingWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.isButtonRequired,
    required this.padding,
    this.childWidget,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Padding(
      padding: padding,
      child: Column(
        children: [
          SizedBox(height: 70.h),
          (childWidget != null)
              ? childWidget!
              : Image.asset(imagePath, width: 358.w, height: 341.h),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Text(title, textAlign: .center, style: textTheme.displayLarge),
                SizedBox(height: 60.h),
                Text(
                  description,
                  textAlign: .center,
                  style: textTheme.labelLarge,
                ),
                SizedBox(height: 40.h),
                isButtonRequired == true
                    ? Align(
                        alignment: .bottomCenter,
                        child: SizedBox(
                          width: 358.w,
                          height: 50.h,
                          child: button,
                        ),
                      )
                    : SizedBox(height: 0.h),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
