import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/features/Onboarding/presentation/widgets/custom_container.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IdeaWidget extends StatelessWidget {
  const IdeaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final isDark = Theme.of(context).brightness == Brightness.dark;
    return CustomContainer(
      shape: BoxShape.rectangle,
      borderRadius: 40.r,
      color: Color(0xFF191919),
      // isDark
      //     ? Theme.of(context).primaryColor
      //     : Colors.white.withValues(green: 0.96),
      width: .infinity,
      height: 256.h,
      margin: EdgeInsets.fromLTRB(30.w, 0, 30.w, 20.h),
      child: Column(
        mainAxisAlignment: .center,

        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 50.w,
            child: Icon(
              Icons.lightbulb_outline_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 40.w,
            ),
          ),
          SizedBox(height: 16.h),
          AnimatedSmoothIndicator(
            count: 3,
            effect: WormEffect(
              dotWidth: 10.w,
              dotHeight: 10.w,
              spacing: 6.w,
              radius: 4.r,
            ),
            activeIndex: 0,
          ),
        ],
      ),
    );
  }
}
