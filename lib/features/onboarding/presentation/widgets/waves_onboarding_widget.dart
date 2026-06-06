import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/features/Onboarding/presentation/widgets/custom_container.dart';
import 'package:notify/features/Onboarding/presentation/widgets/wave_base_widget.dart';

class WavesOnboardingWidget extends StatelessWidget {
  const WavesOnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: .center,

      children: [
        CircleAvatar(
          backgroundColor: Color(0xFF191919),
          radius: 150.r,
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: .center,
                crossAxisAlignment: .end,
                //textBaseline: TextBaseline.alphabetic,
                children: [
                  WaveWidget(width: 8.w, height: 20.h),
                  SizedBox(width: 8.w),
                  WaveWidget(width: 8.w, height: 40.h),
                  SizedBox(width: 8.w),

                  WaveWidget(width: 8.w, height: 60.h),
                  SizedBox(width: 8.w),

                  WaveWidget(width: 8.w, height: 80.h),
                  SizedBox(width: 8.w),

                  WaveWidget(width: 8.w, height: 60.h),
                  SizedBox(width: 8.w),
                  WaveWidget(width: 8.w, height: 40.h),
                  SizedBox(width: 8.w),

                  WaveWidget(width: 8.w, height: 20.h),
                ],
              ),
              Expanded(child: SizedBox(height: 10.h)),

              CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                radius: 50.w,
                child: Icon(
                  Icons.mic,
                  color: Theme.of(context).colorScheme.onPrimary,
                  size: 40.w,
                ),
              ),
              Expanded(child: SizedBox(height: 10.h)),
              Text(
                "00:12:45",
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Colors.white),
              ),
              Expanded(child: SizedBox(height: 10.h)),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 20.w,
          child: CustomContainer(
            width: 60.w,
            height: 60.w,
            margin: EdgeInsets.all(0),
            shape: BoxShape.rectangle,
            color: Theme.of(context).colorScheme.primary,
            borderRadius: 14.r,
            child: Icon(
              Icons.camera_alt_outlined,
              size: 35.w,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          right: 20.w,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 35.w,
            child: Icon(
              Icons.play_arrow_outlined,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 35.w,
            ),
          ),
        ),
      ],
    );
  }
}
