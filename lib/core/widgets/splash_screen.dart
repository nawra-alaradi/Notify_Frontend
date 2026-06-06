import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/core/widgets/skeleton.dart';
import 'package:notify/features/onboarding/presentation/widgets/onboarding_widget.dart';

class SplashScreen extends StatelessWidget {
  static const id = "SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      childWidget: OnboardingWidget(
        title: "NOTIFY",
        description: "",
        imagePath:
            'assets/images/${Theme.of(context).brightness == Brightness.dark ? 'icon-dark.png' : 'icon-light.png'}',
        isButtonRequired: false,
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
      ),
    );
  }
}
