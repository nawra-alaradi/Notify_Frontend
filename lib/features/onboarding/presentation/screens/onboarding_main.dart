import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notify/core/constants/app_constants.dart';
import 'package:notify/core/widgets/skeleton.dart';
import 'package:notify/features/onboarding/onboarding_provider.dart';
import 'package:notify/features/onboarding/presentation/widgets/document_onboarding_widget.dart';
import 'package:notify/features/onboarding/presentation/widgets/idea_widget.dart';
import 'package:notify/features/onboarding/presentation/widgets/waves_onboarding_widget.dart';
import 'package:notify/features/theme/theme_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/onboarding_widget.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({super.key});

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain> {
  late final PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(viewportFraction: 1, keepPage: true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Skeleton(
      childWidget: Column(
        crossAxisAlignment: .stretch,
        children: [
          Expanded(
            child: PageView(
              onPageChanged: (int index) {
                //debugPrint("current $index");
                // context.read<OnboardingBloc>().add(
                //   PageChangedEvent(index: index),
                // );
              },
              padEnds: false,
              controller: _pageController,
              children: [
                OnboardingWidget(
                  title: "Theme Testing",
                  description: "testing theme",
                  imagePath: "",
                  isButtonRequired: false,
                  padding: EdgeInsets.zero,
                  childWidget: ListTile(
                    title: Text("Theme"),
                    trailing: Consumer(
                      builder: (context, ref, child) {
                        return IconButton(
                          onPressed: () {
                            ref.read(themeProvider.notifier).toggle();
                          },
                          icon: Icon(
                            Theme.of(context).brightness == Brightness.light
                                ? Icons.dark_mode
                                : Icons.light_mode,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                OnboardingWidget(
                  title: "NOTIFY",
                  description: "CAPTURE IDEAS ANYWHERE",
                  imagePath:
                      'assets/images/${Theme.of(context).brightness == Brightness.dark ? 'icon-dark.png' : 'icon-light.png'}',
                  isButtonRequired: false,
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                ),
                OnboardingWidget(
                  title: "Capture ideas,\nanywhere",
                  description:
                      "Your digital notebook that stays in sync\nacross all your devices, powered by AI",
                  imagePath: "",
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  childWidget: IdeaWidget(),
                  isButtonRequired: false,
                ),

                OnboardingWidget(
                  title: "Add photos &\nvoice notes.",
                  description:
                      "Capture every detail with multimedia attachments and instant voice memos.",
                  imagePath: "",
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  childWidget: WavesOnboardingWidget(),
                  isButtonRequired: false,
                ),
                OnboardingWidget(
                  title: "Smart summaries in,\none tap.",
                  description:
                      "Let our AI handle the heavy lifting. Turn lengthy recordings and messy notes into concise, actionable summaries instantly.",
                  imagePath: "",
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  childWidget: DocumentOnboardingWidget(),
                  isButtonRequired: true,
                  button: Consumer(
                    builder: (context, ref, child) {
                      return ElevatedButton(
                        onPressed: () {
                          ref
                              .read(onboardingProvider.notifier)
                              .updateOnboardingStatus();
                          //context.go('/login');
                        },
                        child: Text("Get Started"),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _pageController,
              count: kOnboardingPagesLength,
            ),
          ),
          SizedBox(height: 34.h),
          Text(""),
        ],
      ),
    );
  }
}
